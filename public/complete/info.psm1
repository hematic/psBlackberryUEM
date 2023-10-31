function Get-BBUEMSystemInfo {

    <#
    .SYNOPSIS
    Function to Get system info. 

    .DESCRIPTION
    Function to Get system info. 

    .EXAMPLE
    Get-BBUEMSystemInfo

    .OUTPUTS
    psCustomObject

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Info.html#resource_Info_getSystemInfo_GET
    #>

    Param(
    )
    Begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $rest_params = Get-RestParams -method 'Get' -media_type 'systeminfo' -endpoint "/info/systeminfo"
    }
    Process{
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