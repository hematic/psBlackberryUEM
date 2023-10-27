function Get-ProxyCluster {

    <#
    .SYNOPSIS
    Function to Get the Blackberry Proxy Clusters. 

    .DESCRIPTION
    Function to Get the Blackberry Proxy Clusters. 

    .EXAMPLE
    Get-ProxyCluster

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Clusters.html#resource_Clusters_getClusters_GET
    #>

    Param(
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.clusters-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/clusters"

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