function Search-vppAccounts {
    [CmdletBinding(DefaultParameterSetName = 'NameOnly')]
    param(
        [Parameter(ParameterSetName = 'NameOnly')]
        [Parameter(ParameterSetName = 'Both')]
        [string] $vpp_account_name,

        [Parameter(ParameterSetName = 'DateOnly', Mandatory = $true)]
        [Parameter(ParameterSetName = 'Both', Mandatory = $true)]
        [DateTime] $token_expiry_date,

        [Parameter(ParameterSetName = 'DateOnly', Mandatory = $true)]
        [Parameter(ParameterSetName = 'Both', Mandatory = $true)]
        [ValidateSet("Less Than", "Less Than Or Equal To", "Greater Than", "Greater Than Or Equal To")]
        [string] $operator
    )

    begin {
        $Headers = @{
            'Accept'        = 'application/vnd.blackberry.vppaccounts-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }

        $base_url = $global:env:uem_environment + "vppAccounts?query="
        $queryComponents = @()

        switch ($operator) {
            "Less Than" { $operatorSymbol = "<" }
            "Less Than Or Equal To" { $operatorSymbol = "<=" }
            "Greater Than" { $operatorSymbol = ">" }
            "Greater Than Or Equal To" { $operatorSymbol = ">=" }
        }

        if ($vpp_account_name) {
            $queryComponents += "name=$vpp_account_name"
        }
    
        if ($token_expiry_date) {
            $queryComponents += "tokenExpiryDate$operatorSymbol$expiryDateStr"
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

function Get-DepAccountByGuid {

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$vpp_account_guid
    )
    $Headers = @{
        'Accept'        = 'application/vnd.blackberry.vppaccount-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/vppAccounts/$vpp_account_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' { Write-Error "Apple VPP Account not found." }
            default { Write-Error "Authentication failed: $_" }
        } 
    }
}