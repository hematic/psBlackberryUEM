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
        $method = 'Get'
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $Headers = @{
            'Accept'        = 'application/vnd.blackberry.applicationconfigs-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }

        $base_url = $global:env:uem_environment + "/applicationConfigs?query="
        $query = New-AppConfigQuery -search_params $PSBoundParameters -ErrorAction Stop
        $api_url = $base_url + $query

        Write-Debug "URI: $api_url"
        Write-Debug "Headers: $headers"
        Write-Debug "Method: $method"
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' { Write-Error "Invalid Search Query" }
                default { Write-Error "$_" }
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
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $method = 'delete'
        $Headers = @{
            'Accept'        = 'application/vnd.blackberry.applicationconfigs-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }

        $api_url = $global:env:uem_environment + "/applicationConfigs/$app_config_guid"

        Write-Debug "URI: $api_url"
        Write-Debug "Headers: $headers"
        Write-Debug "Method: $method"
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' { Write-Error "Invalid Search Query" }
                '404' { Write-Error "Application config not found" }
                default { Write-Error "$_" }
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
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $method = 'Get'
        $Headers = @{
            'Accept'        = 'application/vnd.blackberry.applicationconfig-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }

        $api_url = $global:env:uem_environment + "/applicationConfigs/$app_config_guid"

        Write-Debug "URI: $api_url"
        Write-Debug "Headers: $headers"
        Write-Debug "Method: $method"
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '404' { Write-Error "Application config not found" }
                default { Write-Error "$_" }
            } 
        }
    }  
}

function Set-ApplicationConfig{

}