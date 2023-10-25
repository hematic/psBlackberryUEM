function Get-BBUEMApplications {

    <#
    .SYNOPSIS

    Function to search the blackberry uem api and get available applications.

    .DESCRIPTION

    This function searches the Blackberry UEM API by uapplication name and returns an array of matching applications.

    .PARAMETER application
    This must be the application in blackberry uem.
    This also accepts wildcarding like 'Blackb*' which would return potentially multiple Blackberry apps.

    .INPUTS

    None.

    .OUTPUTS

    System.Array. Returns an array of applications matching the user guid query.

    .EXAMPLE

    Get-UEMAPIUApplications -application 'UEM Client'

    .EXAMPLE

    Get-UEMAPIUApplications -application 'UEM*'

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Applications.html#resource_Applications_getApplications_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [string]$application
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applications-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }
    $api_url = $global:env:uem_environment + "/applications?query=name=$application"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response.userDevices
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid search query."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}