function Get-SharedDeviceGroups {

    <#
    .SYNOPSIS
    Function to search the blackberry uem api and retrieve all shared device groups.

    .DESCRIPTION
    Get all shared device groups If no shared device groups are found, 
    an empty shared device group list is included in the response body. 

    .EXAMPLE
    Get-SharedDeviceGroups

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Shared_Device_Groups.html#resource_Shared_Device_Groups_getSharedDeviceGroups_GET
    #>
    Param(
    )

    begin{
        $method = 'Get'
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $Headers = @{
            'Accept' = 'application/vnd.blackberry.shareddevicegroups-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
    
        $api_url = $global:env:uem_environment + "/sharedDeviceGroups"
    
        Write-Debug "URI: $api_url"
        Write-Debug "Headers: $headers"
        Write-Debug "Method: $method"
    
    }

    process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400'   {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
                default {Write-Error "$_"}
            } 
        }
    }
}

function Get-SharedDeviceGroupByGuid {

    <#
    .SYNOPSIS
    Function to search the blackberry uem api and get 
    one shared device group by GUID. 

    .DESCRIPTION
    Get one shared device group by GUID. 

    .PARAMETER guid
    GUID of the shared device group to get

    .EXAMPLE
    Get-SharedDeviceGroupByGuid -guid 'b15da5f1-a6e7-4bed-ae51-c3d4b99dc397'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Shared_Device_Groups.html#resource_Shared_Device_Groups_getSharedDeviceGroup_GET
    #>

    Param(
        [Parameter(mandatory=$true)]
        [System.Guid]$guid
    )

    begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $method = 'Get'
        $Headers = @{
            'Accept' = 'application/vnd.blackberry.shareddevicegroup-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
    
        $api_url = $global:env:uem_environment + "/sharedDeviceGroups/$guid"
    
        Write-Debug "URI: $api_url"
        Write-Debug "Headers: $headers"
        Write-Debug "Method: $method"
    }
    process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400'   {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
                '404'   {Write-Error "Shared device group not found."}
                default {Write-Error "$_"}
            } 
        }
    }
}

function Get-SharedDeviceGroupDevices {
    <#
    .SYNOPSIS
    Function to search the blackberry uem api and Get all user devices from a shared device group by GUID. 

    .DESCRIPTION
    This function searches the Blackberry UEM API by username and 
    gets all user devices from a shared device group by GUID. 

    .PARAMETER guid
    Guid of the shared device group to get the UserDevices from

    .EXAMPLE
    Get-SharedDeviceGroupDevices -guid '24caf4ad-41a7-453b-89b3-ef1d313cac1a'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Shared_Device_Groups.html#resource_Shared_Device_Groups_getSharedDeviceGroupDevices_GET
    #>

    Param(
        [Parameter(mandatory=$true)]
        [System.Guid]$guid
    )

    begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $method = 'Get'
        $Headers = @{
            'Accept' = 'application/vnd.blackberry.userdevices-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
    
        $api_url = $global:env:uem_environment + "/sharedDeviceGroups/$guid/userDevices"
    
        Write-Debug "URI: $api_url"
        Write-Debug "Headers: $headers"
        Write-Debug "Method: $method"
    }
    
    process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400'   {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
                '404'   {Write-Error "Shared device group not found."}
                default {Write-Error "$_"}
            } 
        }
    }
}

function Get-SharedDeviceGroupDevice {

    <#
    .SYNOPSIS
    Function to search get the details of a user device from a shared device group by GUID. 

    .DESCRIPTION
    This function searches the Blackberry UEM API and Gets the details of a user device 
    from a shared device group by GUID. 

    .PARAMETER group_guid
    The username to search for.

    .PARAMETER device_guid
    The starting point from where to fetch the next set of results.

    .EXAMPLE
    Search-UEMAPiUser -user 'stephaniem' -offset 5

    .EXAMPLE
    Search-UEMAPiUser -user 'stephan*' -offset 10

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUsers_GET
    #>

    Param(
        [Parameter(mandatory=$true)]
        [System.Guid]$group_guid,

        [Parameter(mandatory=$true)]
        [System.Guid]$device_guid
    )

    begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $method = 'Get'
        $Headers = @{
            'Accept' = 'application/vnd.blackberry.userdevice-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
    
        $api_url = $global:env:uem_environment + "/sharedDeviceGroups/$group_guid/userDevices/$device_guid"
    
        Write-Debug "URI: $api_url"
        Write-Debug "Headers: $headers"
        Write-Debug "Method: $method"
    }

    process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400'   {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
                '404'   {Write-Error "Shared device group not found or Device Not Found."}
                default {Write-Error "$_"}
            } 
        }
    }
}