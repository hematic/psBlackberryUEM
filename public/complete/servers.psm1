function Get-BBUEMServers {
    <#
    .SYNOPSIS
    Get the servers (ex. BlackBerry Unified Endpoint Manager, 
    BlackBerry Connectivity Node) in the UEM topology. 

    .DESCRIPTION
    Get the servers (ex. BlackBerry Unified Endpoint Manager, 
    BlackBerry Connectivity Node) in the UEM topology. 


    .EXAMPLE
    Get-BBUEMServers

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Servers.html#resource_Servers_getServers_GET
    #>

    Param(
    )

    begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $rest_params = Get-RestParams -method 'Get' -media_type 'servers' -endpoint "/servers"
    }

    process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                default {Write-Error "$_"}
            } 
        }
    }
}

function Get-BBUEMServerByGuid {

    <#
    .SYNOPSIS
    Get the server (ex. BlackBerry Unified Endpoint Manager, 
    BlackBerry Connectivity Node) in the UEM topology. 

    .DESCRIPTION
    Get the server (ex. BlackBerry Unified Endpoint Manager, 
    BlackBerry Connectivity Node) in the UEM topology. 

    .PARAMETER server_guid
    The server to get by guid.

    .EXAMPLE
    Get-BBUEMServerByGuid -guid 'b88bb3f5-5056-43d5-851d-b9a55d0984c5'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Servers.html#resource_Servers_getServer_GET
    #>

    Param(
        [Parameter(mandatory=$true)]
        [System.Guid]$server_guid
    )

    begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $rest_params = Get-RestParams -method 'Get' -media_type 'depaccount' -endpoint "/servers/$server_guid"
    }

    process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.methodd
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '404'   {Write-Error "Server not found"}
                default {Write-Error "$_"}
            } 
        }
    }
}

function Get-BBUEMServiceByServer {

    <#
    .SYNOPSIS
    Get the server (ex. BlackBerry Unified Endpoint Manager, 
    BlackBerry Connectivity Node) in the UEM topology. 

    .DESCRIPTION
    Get the server (ex. BlackBerry Unified Endpoint Manager, 
    BlackBerry Connectivity Node) in the UEM topology. 

    .PARAMETER server_guid
    The server to get by guid.

    .PARAMETER type
    The service to get by type.

    .EXAMPLE
    Get-BBUEMServiceByServer -server_guid 'b88bb3f5-5056-43d5-851d-b9a55d0984c5' -type 'Proxy'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Servers.html#resource_Servers_getServiceByServerGuidAndServiceType_GET
    #>

    Param(
        [Parameter(mandatory=$true)]
        [System.Guid]$server_guid,

        [Parameter(mandatory=$true)]
        [String]$type
    )

    begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $rest_params = Get-RestParams -method 'Get' -media_type 'service' -endpoint "/servers/$server_guid/services/$type"
    }

    process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.methodd
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400'   {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
                '404'   {Write-Error "Server or service not found."}
                default {Write-Error "$_"}
            } 
        }
    }
}

function Set-BBUEMServiceByServer {

    <#
    .SYNOPSIS
    Get the server (ex. BlackBerry Unified Endpoint Manager, 
    BlackBerry Connectivity Node) in the UEM topology. 

    .DESCRIPTION
    Updates an existing service. Only direct connection settings can be updated using the route. 
    All other fields are ignored.

    Validation rules for direct connection settings:
        The proxy host name can be set only when direct connect is enabled
        Web proxy related settings can be set only when direct connect is enabled
        Web proxy related settings can be set only when web proxy and direct connect is enabled
        The web proxy port value should be from 0 to 65535 inclusive; any other value is not valid


    .PARAMETER server_guid
    The server to get by guid.

    .PARAMETER type
    The service to get by type.

    .EXAMPLE
    Get-BBUEMServiceByServer -server_guid 'b88bb3f5-5056-43d5-851d-b9a55d0984c5' -type 'Proxy'

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Servers.html#resource_Servers_updateServiceByServerGuidAndServiceType_PUT
    #>

    Param(
        [Parameter(mandatory=$true)]
        [System.Guid]$server_guid,

        [Parameter(mandatory=$true)]
        [String]$type,

        [Parameter(mandatory=$false)]
        [String]$proxy_server_name,

        [Parameter(mandatory=$false)]
        [bool]$direct_connect,

        [Parameter(mandatory=$false)]
        [String]$proxy_host_name,

        [Parameter(mandatory=$false)]
        [bool]$web_proxy,

        [Parameter(mandatory=$false)]
        [String]$web_proxy_host_name,

        [Parameter(mandatory=$false)]
        [int]$web_proxy_port
    )
    begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        If(!$proxy_server_name -and !$direct_connect -and !$proxy_host_name `
            -and !$web_proxy -and !$web_proxy_host_name -and !$web_proxy_port){
            Write-Error "You must pass at least one property of the directConnection object to update."
        }
        $rest_params = Get-RestParams -method 'Put' -media_type 'service' -endpoint "/servers/$server_guid/services/$type"

        $body = [PSCustomObject]@{
            directConnection = [PSCustomObject]@{
            }
        }
        If($proxy_server_name){
            $body.directConnection["proxyServerName"] = $proxy_server_name
        }
        If($direct_connect){
            $body.directConnection["directConnect"] = $direct_connect
        }
        If($proxy_host_name){
            $body.directConnection["proxyHostName"] = $proxy_host_name
        }
        If($web_proxy){
            $body.directConnection["webProxy"] = $web_proxy
        }
        If($web_proxy_host_name){
            $body.directConnection["webProxyHostName"] = $web_proxy_host_name
        }
        If($web_proxy_port){
            $body.directConnection["webProxyPort"] = $web_proxy_port
        }
        $body = $body | ConvertTo-Json
        Write-Debug "Body: $body"
    }

    process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.method -Body $body
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400'   {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
                '404'   {Write-Error "Server or Service not found"}
                '405'   {Write-Error "Service not supported."}
                default {Write-Error "$_"}
            } 
        }
    }
}