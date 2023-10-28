function Ping-BBUEMServer {
    <#
    .SYNOPSIS
    Function to perform an authenticated ping.

    .DESCRIPTION
    Ping server and get the current uptime of the server. 
    This is an authenticated call and can be used to test if 
    the server is up and the authentication header is valid 
    before attempting to access other authenticated routes.

    .EXAMPLE
    Ping-BBUEMServer

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Ping.html#resource_Ping_ping_GET
    #>

    Param(
    )

    $method = 'Get'
    $Headers = @{
        'Accept' = 'text/plain'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/ping"

    Write-Debug "URI: $api_url"
    Write-Debug "Headers: $headers"
    Write-Debug "Method: $method"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404'   {Write-Error "The Server is not available."}
            default {Write-Error "$_"}
        } 
    }
}
