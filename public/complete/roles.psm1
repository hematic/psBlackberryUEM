Function Get-AdminRoles {

    <#
    .SYNOPSIS
    Function to Get a list of all admin roles in the system.

    .DESCRIPTION
    Function to Get a list of all admin roles in the system.

    .EXAMPLE
    Get-AdminRoles

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Roles.html#resource_Roles_getAdminRoles_GET
    #>

    Param(
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.adminroles-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/roles/admin"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            default {Write-Error "$_"}
        } 
    }
}

Function Get-AdminRole {

    <#
    .SYNOPSIS
    Function to Get an admin role by GUID.

    .DESCRIPTION
    Function to Get an admin role by GUID.

    .PARAMETER guid
    GUID of the admin role.

    .EXAMPLE
    Get-AdminRole -guid 'f011e00e-88b8-431f-8e15-bed23d266d0c'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Roles.html#resource_Roles_getAdminRole_GET
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [string] $guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.adminrole-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/roles/admin/$guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404'   {Write-Error "Admin role not found."}
            default {Write-Error "$_"}
        } 
    }
}

Function Get-AdminRoleUsers {

    <#
    .SYNOPSIS
    Function to Get a list of users assigned to the given Admin Role. 

    .DESCRIPTION
    Function to Get a list of users assigned to the given Admin Role. 

    .PARAMETER guid
    GUID of the admin role.

    .EXAMPLE
    Get-AdminRoleUsers -guid 'f011e00e-88b8-431f-8e15-bed23d266d0c'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Roles.html#resource_Roles_getAdminUsers_GET
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [string] $guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.users-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/roles/admin/$guid/users"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404'   {Write-Error "Admin role not found."}
            default {Write-Error "$_"}
        } 
    }
}

Function Remove-AdminRoleFromUser {

    <#
    .SYNOPSIS
    Function to Remove the specific admin role from the specific user.

    .DESCRIPTION
    Function to Remove the specific admin role from the specific user.

    .PARAMETER admin_role_guid
    GUID of the admin role

    .PARAMETER user_guid
    GUID of the user to update

    .EXAMPLE
    Remove-AdminRoleFromUser -admin_role_guid 'a8fafde0-c6b9-4e56-8109-2b9bc0d3c6b1' -user_guid 'f337f066-e53e-44cf-be43-c25738e3fcc8'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Roles.html#resource_Roles_removeAdminRole_DELETE
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid] $admin_role_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid] $user_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.users-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/roles/admin/$admin_role_guid/users/$user_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Delete
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404'   {Write-Error "Admin role not found."}
            '409'   {Write-Error "Unable to remove last security admin."}
            default {Write-Error "$_"}
        } 
    }
}

Function Add-AdminRoleToUser {

    <#
    .SYNOPSIS
    Function to Assign (add or replace) the given user's Admin role with the specific Admin Role.

    .DESCRIPTION
    Function to Assign (add or replace) the given user's Admin role with the specific Admin Role.

    .PARAMETER admin_role_guid
    GUID of the admin role

    .PARAMETER user_guid
    GUID of the user to update

    .EXAMPLE
    Add-AdminRoleToUser -admin_role_guid 'c4c28a00-08be-4835-aa41-4c830f9f1079' -user_guid '9d61240a-e753-4483-93c2-75ef9e73ebfa'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Roles.html#resource_Roles_assignAdminRole_PUT
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid] $admin_role_guid,

        [Parameter(Mandatory = $true)]
        [System.Guid] $user_guid
    )
    $Headers = @{
        'Content-Type' = 'application/vnd.blackberry.users-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/roles/admin/$admin_role_guid/users/$user_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Put
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404'   {Write-Error "Admin role not found."}
            '409'   {Write-Error "Unable to remove last security admin."}
            default {Write-Error "$_"}
        } 
    }
}