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
        $rest_params = Get-RestParams -method 'Get' -media_type 'apnscert' -endpoint "/apnscert"
    }
    Process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                default {Write-Error "HTTP $_"}
            } 
        }
    }
}