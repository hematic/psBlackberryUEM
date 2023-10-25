Function Get-AdminRoles {
    
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
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

Function Get-AdminRole {

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
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

Function Get-AdminRoleUsers {

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
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

Function Remove-AdminRoleFromUser {

    Param(
        [Parameter(Mandatory = $true)]
        [string] $admin_role_guid,

        [Parameter(Mandatory = $true)]
        [string] $user_guid
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
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

Function Add-AdminRoleToUser {

    Param(
        [Parameter(Mandatory = $true)]
        [string] $admin_role_guid,

        [Parameter(Mandatory = $true)]
        [string] $user_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.users-v1+json'
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
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}
