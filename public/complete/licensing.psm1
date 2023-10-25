function Get-LicensingInfo {

    Param(
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.licensing-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/licensing"

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

function Get-GroupBasedLicensingInfo {

    Param(
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.licensing-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/licensing/groups"

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