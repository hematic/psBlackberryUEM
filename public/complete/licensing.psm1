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

    $method = 'Get'
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.licensing-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/licensing"

    Write-Debug "URI: $api_url"
    Write-Debug "Headers: $headers"
    Write-Debug "Method: $method"

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

    $method = 'Get'
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.licensing-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/licensing/groups"
    
    Write-Debug "URI: $api_url"
    Write-Debug "Headers: $headers"
    Write-Debug "Method: $method"

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