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

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.licensing-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/licensing"

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

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.licensing-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/licensing/groups"

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