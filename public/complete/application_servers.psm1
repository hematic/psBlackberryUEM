function Get-ApplicationServers {

    <#
    .SYNOPSIS

    Function to Get the BlackBerry Dynamics application servers.

    .DESCRIPTION

    This function Gets the BlackBerry Dynamics application servers.

    .PARAMETER app_id
    The application identifier.

    .PARAMETER connection_profile_name
    The connection profile name.

    .INPUTS

    None.

    .OUTPUTS

    unknown

    .EXAMPLE

    Get-ApplicationServers -app_id $id -connection_profile_name $profile_name

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Servers.html#resource_Application_Servers_getApplicationServers_GET

    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string] $app_id,

        [Parameter(Mandatory = $false)]
        [String] $connection_profile_name
    )

    begin {
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        If(!$app_id -and !$connection_profile_name){
            Write-error "You must pass either app_id or connection_profile_name."
        }
        $queryComponents = @()

        if ($app_id) {
            $queryComponents += "app_id=$app_id"
        }
        if ($connection_profile_name) {
            $queryComponents += "connectionProfileName=$connectionProfileName"
        }
    
        $rest_params = Get-RestParams -method 'Get' -media_type 'applicationservers' -endpoint $("/applicationServers?query=" + [String]::Join(",", $queryComponents))
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                default { Write-Error "HTTP: $_" }
            } 
        }
    }
}