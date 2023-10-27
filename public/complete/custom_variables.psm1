function Get-CustomVariables {

    <#
    .SYNOPSIS
    Function to Get custom variables.

    .DESCRIPTION
    Function to Get custom variables.

    .EXAMPLE
    Get-CustomVariables

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Custom_variables.html#resource_Custom_variables_getCustomVariables_GET
    #>

    Param(
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.usercustomvariables-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }
    $api_url = $global:env:uem_environment + "/customVariables"

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