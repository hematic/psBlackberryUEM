function Get-CustomVariables {

    <#
    .SYNOPSIS
    Function to Get custom variables.

    .DESCRIPTION
    Function to Get custom variables.
    
    .INPUTS

    None.

    .OUTPUTS
    psCustomObject  with a single property called 'customVaribles' which is an array. Yes that typo is actually what it returns.

    .EXAMPLE
    Get-CustomVariables

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Custom_variables.html#resource_Custom_variables_getCustomVariables_GET
    #>

    Param(
    )
    Begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $rest_params = Get-RestParams -method 'Get' -media_type 'usercustomvariables' -endpoint "/customVariables"
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