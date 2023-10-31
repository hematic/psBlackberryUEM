function Get-LicensingInfo {

    <#
    .SYNOPSIS
    Function to Get licensing information. 

    .DESCRIPTION
    Function to Get licensing information. 

    .EXAMPLE
    Get-LicensingInfo

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Licensing.html#resource_Licensing_getLicensingInformation_GET
    #>

    Param(
    )
    Begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $rest_params = Get-RestParams -method 'Get' -media_type 'licensing' -endpoint "/licensing"
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

function Get-GroupBasedLicensingInfo {

    <#
    .SYNOPSIS
    Function to Get group-based licensing information.

    .DESCRIPTION
    Function to Get group-based licensing information.

    .EXAMPLE
    Get-GroupBasedLicensingInfo

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Licensing.html#resource_Licensing_getGroupLicensingInformation_GET
    #>

    Param(
    )
    begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $rest_params = Get-RestParams -method 'Get' -media_type 'licensing' -endpoint "/licensing/groups"
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