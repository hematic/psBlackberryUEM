function Get-CustomVariables {

    Param(
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.usercustomvariables-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }
    $api_url = $global:env:uem_environment + "/customVariables"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response.userDevices
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}