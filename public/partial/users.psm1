function Search-User {
    <#
    .SYNOPSIS
    Function to search the blackberry uem api by username with pagination.

    .DESCRIPTION
    This function searches the Blackberry UEM API by username and returns one or more user objects with pagination.
    If the user does not exist it returns an empty array.

    .PARAMETER user
    The username to search for.

    .PARAMETER offset
    The starting point from where to fetch the next set of results.

    .EXAMPLE
    Search-UEMAPiUser -user 'stephaniem' -offset 5

    .EXAMPLE
    Search-UEMAPiUser -user 'stephan*' -offset 10

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUsers_GET
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [string]$user,
        
        [Parameter(Mandatory = $false)]
        [int]$offset = 0
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.users-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/users?query=username=$user&max=100&offset=$offset&sortBy=username%20DESC"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid search query."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Get-UserByGuid {

    <#
    .SYNOPSIS

    Function to retrieve a user by it's GUID.

    .DESCRIPTION

    This function searches the Blackberry UEM API by GUID and returns the matching user.

    .PARAMETER user
    This must be the guid of the user in blackberry uem.

    .INPUTS

    None.

    .OUTPUTS

    System.Object. With the user information.

    .EXAMPLE

    Get-UEMAPiUserByGuid -user_guid 'db7c8555-17c2-46b4-be55-86d567f4f7cc'

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDetail_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$user_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.userdetail-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/users/$user_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "User not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Remove-UserByGuid {

    <#
    .SYNOPSIS

    Function to remove a user by it's GUID.

    .DESCRIPTION

    This function removes the matching user from the Blackberry UEM API.

    .PARAMETER user
    This must be the guid of the user in blackberry uem.

    .INPUTS

    None.

    .OUTPUTS

    System.Object. With the user information.

    .EXAMPLE

    Get-UEMAPiUserByGuid -user_guid 'db7c8555-17c2-46b4-be55-86d567f4f7cc'

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDetail_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$user_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.user-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/users/$user_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Delete
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '409' {Write-Error "User has associated services or enrolled devices and cannot be removed."}
            '404' {Write-Error "User not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Get-UserDevices {

    <#
    .SYNOPSIS

    Function to search the blackberry uem api and get devices belonging to a specific user.

    .DESCRIPTION

    This function searches the Blackberry UEM API by userguid and returns one or more user devices.
    If the user does not exist it returns an empty array.

    .PARAMETER user
    This must be the username of the user in blackberry uem.
    This also accepts wildcarding like 'stephan*' which would return potentially multiple stephanies.

    .INPUTS

    None.

    .OUTPUTS

    System.Array. Returns an array of devices matching the user guid query.

    .EXAMPLE

    Get-UEMAPIUserDevices -user_guid $user.guid

    .EXAMPLE

    Get-UEMAPIUserDevices -user_guid 'cf60110b-d540-4b6c-b316-d83aa201344f'

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUserDevices_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [string]$user_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.userdevices-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }
    $api_url = $global:env:uem_environment + "/users/$user_guid/userDevices"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "User or Device not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

#TODO
<#
function Set-BBUEMUserAssignedProfiles {

    
    .SYNOPSIS

    Function to Get assigned profile for a user by profile GUID. 

    .DESCRIPTION

    Function to Get assigned profile for a user by profile GUID. 

    .PARAMETER user_guid
    This must be the guid of the user in blackberry uem.

    .PARAMETER profile_guid
    This must be the guid of the profile in blackberry uem.

    .INPUTS

    None.

    .OUTPUTS

    #TODO

    .EXAMPLE

    Get-BBUEMUserAssignedProfile -user_guid 'db7c8555-17c2-46b4-be55-86d567f4f7cc' -profile_guid $profile_guid

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getProfileAssignedByGuid_GET

    

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$user_guid,

        [Parameter(Mandatory = $true)]
        [System.Array]$profiles
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.profileassignment-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/users/$user_guid/profiles"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Put
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Profile type not supported."}
            '404' {Write-Error "User or profile not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}
#>

function Get-UserAssignedProfile {

    <#
    .SYNOPSIS

    Function to Get assigned profile for a user by profile GUID. 

    .DESCRIPTION

    Function to Get assigned profile for a user by profile GUID. 

    .PARAMETER user_guid
    This must be the guid of the user in blackberry uem.

    .PARAMETER profile_guid
    This must be the guid of the profile in blackberry uem.

    .INPUTS

    None.

    .OUTPUTS

    #TODO

    .EXAMPLE

    Get-BBUEMUserAssignedProfile -user_guid 'db7c8555-17c2-46b4-be55-86d567f4f7cc' -profile_guid $profile_guid

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getProfileAssignedByGuid_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$user_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid]$profile_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.profileassignment-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/users/$user_guid/profiles/$profile_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Profile type not supported."}
            '404' {Write-Error "User or profile not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Get-UserServices {

    <#
    .SYNOPSIS

    Function to retrieve services assigned to a user.

    .DESCRIPTION

    Function to retrieve services assigned to a user.

    .PARAMETER user_guid
    This must be the guid of the user in blackberry uem.

    .INPUTS

    None.

    .OUTPUTS

    #TODO

    .EXAMPLE

    Get-BBUEMUserServices -user_guid 'db7c8555-17c2-46b4-be55-86d567f4f7cc'

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getServices_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$user_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.serviceassignments-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/users/$user_guid/services"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "User not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Get-UserDeviceByGuid {

    <#
    .SYNOPSIS

    Function to search the blackberry uem api and get a specific user device by guid.

    .DESCRIPTION

    Function to search the blackberry uem api and get a specific user device by guid.

    .PARAMETER user_guid
    This must be the guid of the user in blackberry uem.

    .PARAMETER user_guid
    This must be the guid of the device in blackberry uem.

    .INPUTS

    None.

    .OUTPUTS

    System.Object. Returns a device object matching the user guid query.

    .EXAMPLE

    Get-BBUEMUserDeviceByGuid -user_guid $user.guid -device_guid $device_guid

    .EXAMPLE

    Get-UEMAPIUserDevices -user_guid 'cf60110b-d540-4b6c-b316-d83aa201344f'

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUserDevices_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [string]$user_guid,

        [Parameter(Mandatory = $true)]
        [string]$device_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.userdevice-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }
    $api_url = $global:env:uem_environment + "/users/$user_guid/userDevices/$device_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "User or Device not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Get-UserApps {

    <#
    .SYNOPSIS

    Function to retrieve a user by it's GUID.

    .DESCRIPTION

    This function searches the Blackberry UEM API by GUID and returns the matching user.

    .PARAMETER user
    This must be the guid of the user in blackberry uem.

    .INPUTS

    None.

    .OUTPUTS

    System.Object. With the user information.

    .EXAMPLE

    Get-UEMAPiUserByGuid -user_guid 'db7c8555-17c2-46b4-be55-86d567f4f7cc'

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceApplications_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$user_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applicationassignments-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/users/$user_guid/applications"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid search query."}
            '404' {Write-Error "User not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Get-UserAppByGuid {

    <#
    .SYNOPSIS

    Function to retrieve a user by it's GUID.

    .DESCRIPTION

    This function searches the Blackberry UEM API by GUID and returns the matching user.

    .PARAMETER user
    This must be the guid of the user in blackberry uem.

    .INPUTS

    None.

    .OUTPUTS

    System.Object. With the user information.

    .EXAMPLE

    Get-UEMAPiUserByGuid -user_guid 'db7c8555-17c2-46b4-be55-86d567f4f7cc'

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceApplication_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$user_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid]$user_device_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid]$app_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.userdevice.application-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/users/$user_guid/userDevices/$user_device_guid/applications/$app_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "User, Device, or Application not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Invoke-UserDeviceApplicationCommand {

    <#
    .SYNOPSIS

    Function to send commands to act against specific application on the users phone.

    .DESCRIPTION

    This function has a set array of 5 commands it can pass to the phone. Please check out this endpoint
    /{tenantGuid}/api/v1/users/{userGuid}/userDevices/{userDeviceGuid}/applications/{appGuid}/commands
    for specifics on the available commands. Or look at the code below.

    .PARAMETER user_guid
    [System.Guid] This is the guid of the user who owns the device we will be acting against.

    .PARAMETER device_guid
    [System.Guid] This is the guid of the device we will be acting against.

    .PARAMETER application_guid
    [System.Guid] This is the guid of the application installed on the device we will be acting against.

    .PARAMETER command
    [string] This is command we will be sending to act against the application. The only valid commands
    at time of writing are: "LOCK_APPLICATION", "DELETE_APPLICATION","ATTEST_APPLICATION","BLOCK_APPLICATION","UNBLOCK_APPLICATION"

    .PARAMETER type
    [string] This is only passed if the "ATTEST_APPLICATION" command has been passed. Its possible values are: 
    "SAFETYNET", "HARDWARE_KEY", "APP_INTEGRITY"

    .PARAMETER title
    [string] This is only passed if the 'BLOCK_APPLICATION' command has been passed.

    .PARAMETER body
    [string] This is only passed if the 'BLOCK_APPLICATION' command has been passed.

    .PARAMETER actionid
    [string] This is only passed if the 'BLOCK_APPLICATION' or 'UNBLOCK_APPLICATION' commands have been passed.

    .INPUTS

    None.

    .OUTPUTS

    No idea yet, havent been able to test it.

    .EXAMPLE

    #This deletes all app data for an application.
    Invoke-UEMUserDeviceApplicationCommand -user_guid $uguid -device_guid $dguid -application_guid $aguid -command 'DELETE_APPLICATION'

    .EXAMPLE
    
    #This would block the passed application and display a message on the phone.
    Invoke-UEMUserDeviceApplicationCommand -user_guid $uguid -device_guid $dguid -application_guid $aguid -command 'BLOCK_APPLICATION' `
                                           -title $title -body 'You have had an application blocked' -actionid 'wc_blackberry_work_block'

    .EXAMPLE
    
    #This actually have no idea what attestation means.
    Invoke-UEMUserDeviceApplicationCommand -user_guid $uguid -device_guid $dguid -application_guid $aguid -command 'ATTEST_APPLICATION' -type "HARDWARE_KEY"

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_sendUserDeviceApplicationCommand_POST

    #>

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$user_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid]$device_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid]$application_guid,

        [Parameter(Mandatory = $true, ParameterSetName = 'ATTEST_APPLICATION')]
        [Parameter(Mandatory = $true, ParameterSetName = 'BLOCK_APPLICATION')]
        [Parameter(Mandatory = $true, ParameterSetName = 'UNBLOCK_APPLICATION')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Default')]
        [ValidateSet("LOCK_APPLICATION", "DELETE_APPLICATION","ATTEST_APPLICATION","BLOCK_APPLICATION","UNBLOCK_APPLICATION")]
        [string]$command,

        [Parameter(Mandatory = $true, ParameterSetName = 'ATTEST_APPLICATION')]
        [ValidateSet("SAFETYNET", "HARDWARE_KEY", "APP_INTEGRITY")]
        [string]$type,

        [Parameter(Mandatory = $true, ParameterSetName = 'BLOCK_APPLICATION')]
        [string]$title,

        [Parameter(Mandatory = $true, ParameterSetName = 'BLOCK_APPLICATION')]
        [string]$body,

        [Parameter(Mandatory = $true, ParameterSetName = 'BLOCK_APPLICATION')]
        [Parameter(Mandatory = $true, ParameterSetName = 'UNBLOCK_APPLICATION')]
        [string]$actionId
    )

    begin {
        $method = 'Post'
        $Headers = @{
            'Content-Type' = 'application/vnd.blackberry.command-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
        $api_url = $global:env:uem_environment + "/users/$user_guid/userDevices/$device_guid/applications/$application_guid/commands"

        switch ($PsCmdlet.ParameterSetName) {
            "ATTEST_APPLICATION" {
                Write-Debug "Matched: ATTEST_APPLICATION"
                $RequestBody = New-UEMAttestApplicationRequestBody -type $type
            }
            "BLOCK_APPLICATION" {
                Write-Debug "Matched: BLOCK_APPLICATION"
                $RequestBody = New-UEMBlockApplicationRequestBody -actionId $actionId -title $title -body $body
            }
            "UNBLOCK_APPLICATION" {
                Write-Debug "Matched: UNBLOCK_APPLICATION"
                $RequestBody = New-UEMUnblockApplicationRequestBody -actionId $actionId
            }
            "LOCK_APPLICATION" {
                Write-Debug "Matched: LOCK_APPLICATION"
                $RequestBody = New-UEMLockApplicationRequestBody
            }
            "DELETE_APPLICATION" {
                Write-Debug "Matched: DELETE_APPLICATION"
                $RequestBody = New-UEMDeleteApplicationRequestBody
            }
        }
    }
    process {
        try {

            Write-Debug "URI: $api_url"
            Write-Debug "Headers: $($headers | Out-String)"
            Write-Debug "Method: $method"
            Write-Debug "Body: $RequestBody"

            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method -Body $RequestBody
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' {Write-Error "Invalid request. For example, command not supported or invalid field semantics."}
                '404' {Write-Error "User, Device, or application not found."}
                default {Write-Error "$_"}
            } 
        }
    }
}

function Invoke-UserDeviceCommand {

    <#
    .SYNOPSIS

    Function to send commands to act against an entire device.

    .DESCRIPTION

    This function has a set array of 18 commands it can pass to the phone. Please check out this endpoint
    /{tenantGuid}/api/v1/users/{userGuid}/userDevices/{userDeviceGuid}/commands
    for specifics on the available commands. Or look at the code below. Currently there is not code coverage
    for all 18 commands. More can be added as needed.

    .PARAMETER user_guid
    [System.Guid] This is the guid of the user who owns the device we will be acting against.

    .PARAMETER device_guid
    [System.Guid] This is the guid of the device we will be acting against.

    .PARAMETER command
    [string] This is command we will be sending to act against the application. The only valid commands
    we support right now are: "DELETE_WORK_SPACE_DATA","REMOVE_DEVICE"


    .INPUTS

    None.

    .OUTPUTS

    No idea yet, havent been able to test it.

    .EXAMPLE

    #This deletes all app data for an application.
    Invoke-UEMUserDeviceApplicationCommand -user_guid $uguid -device_guid $dguid -application_guid $aguid -command 'DELETE_APPLICATION'

    .EXAMPLE
    
    #This would delete only work data on the device.
    Invoke-UEMUserDeviceApplicationCommand -user_guid $uguid -device_guid $dguid -command 'DELETE_WORK_SPACE_DATA' 

    .EXAMPLE
    
    #This would remove a device from UEM without waiting for a response from the device.
    Invoke-UEMUserDeviceApplicationCommand -user_guid $uguid -device_guid $dguid -command 'REMOVE_DEVICE' 

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_sendUserDeviceCommand_POST

    #>

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$user_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid]$device_guid,

        [Parameter(Mandatory = $true)]
        [ValidateSet("DELETE_WORK_SPACE_DATA","REMOVE_DEVICE")]
        [string]$command
    )

    begin {
        $Headers = @{
            'Content-type' = 'application/vnd.blackberry.command-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
        $api_url = $global:env:uem_environment + "/users/$user_guid/userDevices/$device_guid/commands"

        switch ($command) {
            "DELETE_WORK_SPACE_DATA" {
                $RequestBody = New-UEMDeleteWorkSpaceDataRequestBody
            }
            "REMOVE_DEVICE" {
                $RequestBody = New-UEMRemoveDeviceRequestBody
            }
        }
    }
    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Post -Body $RequestBody
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' {Write-Error "Invalid request. For example, command not supported or invalid field semantics."}
                '404' {Write-Error "User or Device not found."}
                default {Write-Error "Authentication failed: $_"}
            } 
        }
    }
}

function Get-UserDeviceCommandStatus {

    <#
    .SYNOPSIS

    Function to retrieve status of command that has been sent to a device.

    .DESCRIPTION

    This function has a set array of 18 commands it can pass to the phone. Please check out this endpoint
    /{tenantGuid}/api/v1/users/{userGuid}/userDevices/{userDeviceGuid}/commands
    for specifics on the available commands. Or look at the code below. Currently there is not code coverage
    for all 18 commands. More can be added as needed.

    .PARAMETER user_guid
    [System.Guid] This is the guid of the user who owns the device we will be acting against.

    .PARAMETER device_guid
    [System.Guid] This is the guid of the device we will be acting against.

    .PARAMETER command_guid
    [System.Guid] This is the guid of the command we will be searching for.


    .INPUTS

    None.

    .OUTPUTS

    No idea yet, havent been able to test it.

    .EXAMPLE

    #This deletes all app data for an application.
    Get-UEMUserDeviceCommandStatus -user_guid $uguid -device_guid $dguid -command_guid $cguid

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceCommandStatus_GET

    #>

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$user_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid]$device_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid]$command_guid
    )

    begin {
        $Headers = @{
            'Accept' = 'application/vnd.blackberry.command-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
        $api_url = $global:env:uem_environment + "/users/$user_guid/userDevices/$device_guid/commands/$command_guid"

    }
    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' {Write-Error "Invalid request. For example, command not supported or invalid field semantics."}
                '404' {Write-Error "User, Device, or Device Command not found."}
                default {Write-Error "Authentication failed: $_"}
            } 
        }
    }
}

function Get-UserDeviceProfiles {

    <#
    .SYNOPSIS

    Function to retrieve effective device profiles for a device.

    .DESCRIPTION

    Get effective profiles for a user device. The effective profiles are the profiles 
    that will actually get delivered to the user device. A profile that is assigned to 
    a user directly, via a user group, or via a device group may not actually get delivered 
    to the user device, for example due to OS and version compatibility.

    .PARAMETER user_guid
    [System.Guid] This is the guid of the user who owns the device we will be acting against.

    .PARAMETER device_guid
    [System.Guid] This is the guid of the device we will be acting against.


    .INPUTS

    None.

    .OUTPUTS

    No idea yet, havent been able to test it.

    .EXAMPLE

    Get-UEMUserDeviceProfile -user_guid $uguid -device_guid $dguid

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceProfiles_GET

    #>

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$user_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid]$device_guid
    )
    begin {
        $Headers = @{
            'Accept' = 'application/vnd.blackberry.profiles-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
        $api_url = $global:env:uem_environment + "/users/$user_guid/userDevices/$device_guid/profiles"

    }
    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '404' {Write-Error "User or Device not found."}
                default {Write-Error "Authentication failed: $_"}
            } 
        }
    }
}