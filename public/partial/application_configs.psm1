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
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $query = New-AppConfigQuery -search_params $PSBoundParameters -ErrorAction Stop
        $rest_params = Get-RestParams -method 'Get' -media_type 'applicationconfigs' -endpoint $("/applicationConfigs?query=" + $query)
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.method
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
        $rest_params = Get-RestParams -method 'Delete' -media_type 'applicationconfigs' -endpoint "/applicationConfigs/$app_config_guid"
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.method
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
        $rest_params = Get-RestParams -method 'Get' -media_type 'applicationconfig' -endpoint "/applicationConfigs/$app_config_guid"
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.method
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