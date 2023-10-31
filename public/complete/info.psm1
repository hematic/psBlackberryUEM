function Get-BBUEMSystemInfo {

    <#
    .SYNOPSIS
    Function to Get system info. 

    .DESCRIPTION
    Function to Get system info. 

    .EXAMPLE
    Get-BBUEMSystemInfo

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Info.html#resource_Info_getSystemInfo_GET
    #>

    Param(
    )
    Begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $method = 'Get'
        $Headers = @{
            'Accept' = 'application/vnd.blackberry.systeminfo-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
    
        $api_url = $global:env:uem_environment + "/info/systeminfo"
    
        Write-Debug "URI: $api_url"
        Write-Debug "Headers: $headers"
        Write-Debug "Method: $method"
    
    }
    Process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                default {Write-Error "$_"}
            } 
        }
    }
}