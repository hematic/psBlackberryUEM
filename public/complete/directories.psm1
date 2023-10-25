function Get-ProxyCluster {

    Param(
        [Parameter(Mandatory = $true)]
        [string]$user,
        [Parameter(Mandatory = $false)]
        [ValidateRange(1, 100)]
        [int]$limit = 100,
        [Parameter(Mandatory = $false)]
        [bool]$include_existing_users = $false
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.directoryusers-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/directories/users?search=$user&limit=$limit&includeExistingUsers=$include_exisiting_users"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response.userDevices
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
            '409' {Write-Error "No company directories configured."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}