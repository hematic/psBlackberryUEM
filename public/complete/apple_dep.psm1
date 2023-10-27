function Search-DepAccounts {
    <#
    .SYNOPSIS
    Function to get a list of all DEP accounts.

    .DESCRIPTION
    This function searches the Blackberry UEM API by name or tokenExpiryDate and 
    returns one or more dep accounts with pagination information.

    .PARAMETER name
    The DEP account name to search for.

    .PARAMETER tokenExpiryDate
    Expiration date value in ISO-8601 format yyyy-MM-ddTHH:mm:ss.SSSZ. 
    Use operators > or >= for the minimum date, and/or < or <= for the maximum date. 
    For example: tokenExpiryDate>=2021-07-01T00:00:00.000Z,tokenExpiryDate<2021-07-31T00:00:00.000Z.

    .PARAMETER offset
    The number of matching accounts to exclude from the beginning of the list of accounts 
    in the response; greater than or equal to 0. If not specified, a value of 0 will be used 
    to indicate that no matches should be excluded. Used in order to get "pages" of results. 
    For example, to get the first 50 matching accounts, specify max=50 (and optionally offset=0); 
    and to get the next 50 matching accounts specify max=50 and offset=50, and so on.

    .PARAMETER max
    The maximum number of account results to get, between 1 and 1000 inclusive. 
    If not specified, a value of 100 will be used.

    .EXAMPLE
    Search-DepAccounts -name 'sales'

    .EXAMPLE
    Search-DepAccounts -token_expiry_date '2021-07-01T00:00:00.000Z' -max 70

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_getDepAccounts_GET
    #>

    Param(
        [Parameter(Mandatory = $true, ParameterSetName = 'ByName')]
        [string]$name,

        [Parameter(Mandatory = $true, ParameterSetName = 'ByToken')]
        [DateTime]$token_expiry_date,
        
        [Parameter(Mandatory = $false, ParameterSetName = 'ByName')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ByToken')]
        [int]$offset = 0,

        [Parameter(Mandatory = $false, ParameterSetName = 'ByName')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ByToken')]
        [int]$max = 100
    )

    begin{
        $Headers = @{
            'Accept' = 'application/vnd.blackberry.depaccounts-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
    }

    process{
        switch ($PsCmdlet.ParameterSetName) {
            "ByToken" {
                $api_url = $global:env:uem_environment + "/depAccounts?query=name=$name&max=$max&offset=$offset&includeTotal=true"
            }
            "ByName" {
                $api_url = $global:env:uem_environment + "/depAccounts?query=tokenExpiryDate=$token_expiry_date&max=$max&offset=$offset&includeTotal=true"
            }
            default{
                Write-Error "Unable to determine proper parameter set."
            }
        }

        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' {Write-Error "Invalid search query. If using token_expiry date please ensure the datetime is in the ISO 8601 format."}
                default {Write-Error "$_"}
            } 
        }
    }
}

function Get-DepAccountByGuid {
    <#
    .SYNOPSIS
    Function to get details of a DEP account by GUID.

    .DESCRIPTION
    Function to get details of a DEP account by GUID.

    .PARAMETER dep_account_guid
    The DEP account guid to search for.

    .EXAMPLE
    Get-DepAccountByGuid -dep_account_guid 'eb4f5da2-e221-4403-a78f-3513902e2718'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_getDepAccount_GET
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$dep_account_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.depaccount-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/depAccounts/$dep_account_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "Dep Account not found."}
            default {Write-Error "$_"}
        } 
    }
}

function Search-DepDevices {
    <#
    .SYNOPSIS
    Function to get a list of all DEP devices.

    .DESCRIPTION
    This function searches the Blackberry UEM API by depAccountName or serialNumber and 
    returns one or more dep device with pagination information.

    .PARAMETER dep_account_name
    The DEP account name to search for.

    .PARAMETER serial_number
    Serial number of the DEP device.

    .PARAMETER offset
    The number of matching accounts to exclude from the beginning of the list of accounts 
    in the response; greater than or equal to 0. If not specified, a value of 0 will be used 
    to indicate that no matches should be excluded. Used in order to get "pages" of results. 
    For example, to get the first 50 matching accounts, specify max=50 (and optionally offset=0); 
    and to get the next 50 matching accounts specify max=50 and offset=50, and so on.

    .PARAMETER max
    The maximum number of account results to get, between 1 and 1000 inclusive. 
    If not specified, a value of 100 will be used.

    .EXAMPLE
    Search-DepDevices -dep_account_name 'sales'

    .EXAMPLE
    Search-DepDevices -serial_number 'C7JRXTGCGRY6' -max 70

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_getDepDevices_GET
    #>

    Param(
        [Parameter(Mandatory = $true, ParameterSetName = 'ByName')]
        [string]$dep_account_name,

        [Parameter(Mandatory = $true, ParameterSetName = 'BySerial')]
        [string]$serial_number,
        
        [Parameter(Mandatory = $false, ParameterSetName = 'ByName')]
        [Parameter(Mandatory = $false, ParameterSetName = 'BySerial')]
        [int]$offset = 0,

        [Parameter(Mandatory = $false, ParameterSetName = 'ByName')]
        [Parameter(Mandatory = $false, ParameterSetName = 'BySerial')]
        [int]$max = 100
    )

    begin{
        $Headers = @{
            'Accept' = 'application/vnd.blackberry.depdevices-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
    }

    process{
        switch ($PsCmdlet.ParameterSetName) {
            "ByToken" {
                $api_url = $global:env:uem_environment + "/depDevices?query=depAccountName=$name&max=$max&offset=$offset&includeTotal=true"
            }
            "ByName" {
                $api_url = $global:env:uem_environment + "/depDevices?query=serialNumber=$serial_number&max=$max&offset=$offset&includeTotal=true"
            }
            default{
                Write-Error "Unable to determine proper parameter set."
            }
        }

        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' {Write-Error "Invalid search query."}
                default {Write-Error "$_"}
            } 
        }
    }
}

function Get-DepDeviceByGuid {
    <#
    .SYNOPSIS
    Function to get details of a DEP device by GUID.

    .DESCRIPTION
    Function to get details of a DEP device by GUID.

    .PARAMETER dep_device_guid
    The DEP device guid to search for.

    .EXAMPLE
    Get-DepDeviceByGuid -dep_device_guid 'eb4f5da2-e221-4403-a78f-3513902e2718'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_getDepDevice_GET
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$dep_device_guid
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.depdevice-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/depDevices/$dep_device_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "Dep Device not found."}
            default {Write-Error "$_"}
        } 
    }
}

function Remove-UserFromDepDevice {
    <#
    .SYNOPSIS
    Function to Unassign a user, by GUID, from a DEP device.

    .DESCRIPTION
    Function to Unassign a user, by GUID, from a DEP device.

    .PARAMETER dep_device_guid
    The DEP device guid to search for.

    .EXAMPLE
    Remove-UserFromDepDevice -dep_device_guid 'eb4f5da2-e221-4403-a78f-3513902e2718'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_unassignUserFromDEPDevice_DELETE
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$dep_device_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.depdevice-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/depDevices/$dep_device_guid/user"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Delete
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "Dep Device not found."}
            '409' {Write-Error "User cannot be unassigned from device, the device is already activated."}
            default {Write-Error "$_"}
        } 
    }
}

function Set-DepDeviceUser {
    <#
    .SYNOPSIS
    Function to Assign (add or replace) the given user to a DEP device.

    .DESCRIPTION
    Function to Assign (add or replace) the given user to a DEP device.

    .PARAMETER dep_device_guid
    GUID of DEP device

    .PARAMETER user_guid
    GUID of user

    .EXAMPLE
    Set-DepDeviceUser -dep_device_guid 'eb4f5da2-e221-4403-a78f-3513902e2718' -user_guid '49562438-7f3c-4853-8347-3c18b03cbd8c'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_assignUserToDEPDevice_PUT
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$dep_device_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid]$user_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.depdevice-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/depDevices/$dep_device_guid/user/$user_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Delete
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "Dep Device or User not found."}
            '409' {Write-Error "User cannot be assigned from device, the device is already activated."}
            default {Write-Error "$_"}
        } 
    }
}

function Search-DepEnrollmentConfigs {
    <#
    .SYNOPSIS
    Function to Get list of all DEP enrollment configurations.

    .DESCRIPTION
    Function to Get list of all DEP enrollment configurations.

    .PARAMETER dep_account_name
    DEP account name of the DEP enrollment config.

    .PARAMETER name
    DEP enrollment configuration name.

    .EXAMPLE
    Search-DepEnrollmentConfigs -dep_account_name 'sales'

    .EXAMPLE
    Search-DepEnrollmentConfigs -config_name 'C7JRXTGCGRY6' -dep_account_name 'sales'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_getDepEnrollmentConfigs_GET
    #>

    Param(
        [Parameter(Mandatory = $false)]
        [string]$dep_account_name,

        [Parameter(Mandatory = $false)]
        [string]$config_name
    )

    begin{
        if(!$dep_account_name -and !$config_name){
            Write-Error "This function requires you pass at least one of the two existing parameters."
        }
        $Headers = @{
            'Accept' = 'application/vnd.blackberry.enrollmentconfigurations-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
    }

    process{
        if($dep_account_name) {
            If($config_name){
                $api_url = $global:env:uem_environment + "/enrollmentConfigurations?query=depAccountName=$dep_account_name,name=$config_name"
            }
            $api_url = $global:env:uem_environment + "/enrollmentConfigurations?query=depAccountName=$dep_account_name"
        }
        else{
            $api_url = $global:env:uem_environment + "/enrollmentConfigurations?query=name=$config_name"
        }

        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' {Write-Error "Invalid search query."}
                default {Write-Error "$_"}
            } 
        }
    }
}

function Get-DepEnrollmentConfigByGuid {
    <#
    .SYNOPSIS
    Function to Get details of a DEP enrollment configuration by GUID. 

    .DESCRIPTION
    Function to Get details of a DEP enrollment configuration by GUID. 

    .PARAMETER dep_enrollment_config_guid
    GUID of the DEP enrollment config to get

    .EXAMPLE
    Get-DepEnrollmentConfigByGuid -dep_enrollment_config_guid 'eb4f5da2-e221-4403-a78f-3513902e2718'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_getDepEnrollmentConfig_GET
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$dep_enrollment_config_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.enrollmentconfiguration-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/enrollmentConfigurations/$dep_enrollment_config_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "Dep Enrollment Configuration not found."}
            default {Write-Error "$_"}
        } 
    }
}

function Remove-EnrollmentConfigFromDepDevices {

    <#
    .SYNOPSIS
    Unassign DEP enrollment configuration from one or more DEP devices by GUID. 
    Only the GUID field of each DEP device is required. If a device listed in the 
    request body doesn't have enrollment configuration assigned or has another enrollment 
    configuration assigned, it will be ignored. If enrollment configuration was not 
    unassigned from one or more devices listed in the request, these devices will be returned 
    in the response. 

    .DESCRIPTION
    Unassign DEP enrollment configuration from one or more DEP devices by GUID. 
    Only the GUID field of each DEP device is required. If a device listed in the 
    request body doesn't have enrollment configuration assigned or has another enrollment 
    configuration assigned, it will be ignored. If enrollment configuration was not 
    unassigned from one or more devices listed in the request, these devices will be returned 
    in the response. 

    .PARAMETER dep_enrollment_config_guid
    GUID of enrollment configuration.

    .PARAMETER dep_device_guids
    Guids of DEP devices

    .EXAMPLE
    Remove-EnrollmentConfigFromDepDevices -$dep_enrollment_config_guid '51591f77-cd3a-4dea-9bd6-8addd47b6fe2' -dep_device_guids $device_guids

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_unassignEnrollmentConfigurationFromDEPDevices_DELETE
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$dep_enrollment_config_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid[]]$dep_device_guids
    )
    $Headers = @{
        'Content-Type' = 'application/vnd.blackberry.depdevices-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/enrollmentConfigurations/$dep_enrollment_config_guid/depDevices"

    try {
        Invoke-IgnoreCertForPS5
        $body = New-UEMEnrollmentConfigFromDepDeviceRequestBody -GuidArray $dep_device_guids
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Delete -Body $body
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "Dep Device or Enrollment Configuration not found."}
            '409' {Write-Error "Enrollment configuration cannot be unassigned from devices, some of the devices have been already activated."}
            default {Write-Error "$_"}
        } 
    }
}

function Add-EnrollmentConfigtoDepDevices {

    <#
    .SYNOPSIS
    Assign DEP enrollment configuration to one or more DEP devices by GUID. 
    Only the GUID field of each DEP device is required. If a device listed 
    in the request body already has enrollment configuration assigned, it 
    will be overwritten. If enrollment configuration cannot be assigned to 
    one or more of the devices listed in the request, these devices will be 
    returned in the response. 

    .DESCRIPTION
    Assign DEP enrollment configuration to one or more DEP devices by GUID. 
    Only the GUID field of each DEP device is required. If a device listed 
    in the request body already has enrollment configuration assigned, it 
    will be overwritten. If enrollment configuration cannot be assigned to 
    one or more of the devices listed in the request, these devices will be 
    returned in the response. 

    .PARAMETER dep_enrollment_config_guid
    GUID of enrollment configuration.

    .PARAMETER dep_device_guids
    Guids of DEP devices

    .EXAMPLE
    Add-EnrollmentConfigtoDepDevices -$dep_enrollment_config_guid '51591f77-cd3a-4dea-9bd6-8addd47b6fe2' -dep_device_guids $device_guids

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_assignEnrollmentConfigurationToDEPDevices_POST
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$dep_enrollment_config_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid[]]$dep_device_guids
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.depdevices-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/enrollmentConfigurations/$dep_enrollment_config_guid/depDevices"

    try {
        Invoke-IgnoreCertForPS5
        $body = New-UEMEnrollmentConfigFromDepDeviceRequestBody -GuidArray $dep_device_guids
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Post -Body $body
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "Dep Device or Enrollment Configuration not found."}
            '409' {Write-Error "Enrollment configuration cannot be assigned to devices, some of the devices have been already activated."}
            default {Write-Error "$_"}
        } 
    }
}