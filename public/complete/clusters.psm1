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
    Begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $rest_params = Get-RestParams -method 'Get' -media_type 'clusters' -endpoint "/clusters"
    }
    Process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                default {Write-Error "HTTP: $_"}
            } 
        }
    }
}