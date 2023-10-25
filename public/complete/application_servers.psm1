function Get-ApplicationServers {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string] $app_id,

        [Parameter(Mandatory = $false)]
        [String] $connectionProfileName
    )

    begin {

        If(!$app_id -and !$connection_profile_name){
            Write-error "You must pass either app_id of connection_profile_name."
        }

        $Headers = @{
            'Accept'        = 'application/vnd.blackberry.applicationservers-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }

        $base_url = $global:env:uem_environment + "applicationServers?query="
        $queryComponents = @()

        if ($app_id) {
            $queryComponents += "app_id=$app_id"
        }
    
        if ($connection_profile_name) {
            $queryComponents += "connectionProfileName=$connectionProfileName"
        }
    
        $api_url = $base_url + [String]::Join(",", $queryComponents)
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                default { Write-Error "Authentication failed: $_" }
            } 
        }
    }
}