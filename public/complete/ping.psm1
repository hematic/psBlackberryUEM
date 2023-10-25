function Get-BBUEMSystemInfo {

    Param(
    )

    $api_url = $global:env:uem_environment + "/ping"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "The server is not available"}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}