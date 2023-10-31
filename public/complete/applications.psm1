function Get-BBUEMApplications {

    <#
    .SYNOPSIS

    Function to search the blackberry uem api and get available applications.

    .DESCRIPTION

    This function searches the Blackberry UEM API by uapplication name, package id, or with no filter and returns an array of matching applications.

    .PARAMETER name
    This must be the application in blackberry uem.
    This also accepts wildcarding like 'Blackb*' which would return potentially multiple Blackberry apps.

    .PARAMETER package_id
    This must be the package_id in blackberry uem.

    .INPUTS

    None.

    .OUTPUTS

    System.Array. Returns an array of applications matching the user guid query.

    .EXAMPLE

    Get-UEMAPIUApplications name 'UEM Client'

    .EXAMPLE

    Get-UEMAPIUApplications package_id '8675309'

    .EXAMPLE

    Get-UEMAPIUApplications

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Applications.html#resource_Applications_getApplications_GET

    #>

    Param(
        [Parameter(Mandatory = $false)]
        [string]$name,

        [Parameter(Mandatory = $false)]
        [string]$package_id

    )
    Begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        If($name){
            $endpoint = "/applications?query=name=$name"
        }
        ElseIf($package_id){
            $endpoint = "/applications?query=packageId=$package_id"
        }
        Else{
            $endpoint = "/applications"
        }

        $rest_params = Get-RestParams -method 'Get' -media_type 'applications' -endpoint $endpoint
    }
    Process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' {Write-Error "Invalid search query."}
                default {Write-Error "$_"}
            } 
        }
    }
}