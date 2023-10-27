function Search-ApplicationConfigs{
    param(
        [Parameter(Mandatory = $False)]
        [string] $app_name,

        [Parameter(Mandatory = $False)]
        [string] $app_package_id,

        [Parameter(Mandatory = $False)]
        [System.Guid] $app_guid,

        [Parameter(Mandatory = $False)]
        [System.Guid] $guid,

        [Parameter(Mandatory = $False)]
        [string] $name,

        [Parameter(Mandatory = $False)]
        [int] $rank
    )


    begin {
        $Headers = @{
            'Accept'        = 'application/vnd.blackberry.applicationconfigs-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }

        $base_url = $global:env:uem_environment + "/applicationConfigs?query="
        $query = New-AppConfigQuery -search_params $PSBoundParameters -ErrorAction Stop
        $api_url = $base_url + $query

        Write-host $api_url
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' { Write-Error "Invalid Search Query" }
                default { Write-Error "Authentication failed: $_" }
            } 
        }
    }
}

function New-ApplicationConfig{

}

function Remove-ApplicationConfig{
    param(
        [Parameter(Mandatory = $true)]
        [string] $app_config_guid
    )

    begin {
        $Headers = @{
            'Accept'        = 'application/vnd.blackberry.applicationconfigs-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }

        $api_url = $global:env:uem_environment + "/applicationConfigs/$app_config_guid"
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Delete
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' { Write-Error "Invalid Search Query" }
                '404' { Write-Error "Application config not found" }
                default { Write-Error "Authentication failed: $_" }
            } 
        }
    }  
}

function Get-ApplicationConfig{
    param(
        [Parameter(Mandatory = $true)]
        [string] $app_config_guid
    )

    begin {
        $Headers = @{
            'Accept'        = 'application/vnd.blackberry.applicationconfig-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }

        $api_url = $global:env:uem_environment + "/applicationConfigs/$app_config_guid"
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '404' { Write-Error "Application config not found" }
                default { Write-Error "Authentication failed: $_" }
            } 
        }
    }  
}

function Set-ApplicationConfig{

}