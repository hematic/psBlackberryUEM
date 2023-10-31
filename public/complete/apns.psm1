function Get-APNsCert {
    <#
    .SYNOPSIS

    Function to retrieve status of the APNs certificate

    .DESCRIPTION

    Function to retrieve status of the APNs certificate


    .INPUTS

    None.

    .OUTPUTS

    #TODO

    .EXAMPLE

    Get-APNsCert

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_APNs.html#resource_APNs_getAPNsInfo_GET

    #>
    Param(
    )
    Begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"

        $Headers = @{
            'Accept' = 'application/vnd.blackberry.apnscert-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
        
        $method = 'Get'
        $api_url = $global:env:uem_environment + "/apnscert"
    
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