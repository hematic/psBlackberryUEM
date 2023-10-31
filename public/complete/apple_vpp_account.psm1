function Search-vppAccounts {

    <#
    .SYNOPSIS

    Function to Get details of Apple VPP accounts from a query.

    .DESCRIPTION

    Function to Get details of Apple VPP accounts from a query.

    .PARAMETER vpp_account_name
    The name of the Apple VPP account.

    .PARAMETER token_expiry_date
    The Apple VPP account token expiry date.

    .PARAMETER operator
    "Less Than", "Less Than Or Equal To", "Greater Than", "Greater Than Or Equal To"

    .INPUTS

    None.

    .OUTPUTS

    unknown

    .EXAMPLE

    Search-vppAccounts -vpp_account_name 'VPP-token-version-3' -token_expiry_date '2027-01-01T00:00:00.000Z' -operator 'Less Than'

    .LINK

   https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_VPP_Account.html#resource_Apple_VPP_Account_getVppAccounts_GET

    #>

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
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $method = 'Get'
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
                default { Write-Error "$_" }
            } 
        }
    }
}

function Get-VPPAccountByGuid {

    <#
    .SYNOPSIS

    Function to Get details of an Apple VPP account by GUID

    .DESCRIPTION

    Function to Get details of an Apple VPP account by GUID

    .PARAMETER vpp_account_guid
    The name of the Apple VPP account.

    .INPUTS

    None.

    .OUTPUTS

    unknown

    .EXAMPLE

    Get-VPPAccountByGuid -vpp_account_guid
    .LINK

   https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_VPP_Account.html#resource_Apple_VPP_Account_getVppAccount_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$vpp_account_guid
    )
    Begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $method = 'Get'
        $Headers = @{
            'Accept'        = 'application/vnd.blackberry.vppaccount-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }
    
        $api_url = $global:env:uem_environment + "/vppAccounts/$vpp_account_guid"
    
        Write-Debug "URI: $api_url"
        Write-Debug "Headers: $headers"
        Write-Debug "Method: $method"
    }
    Process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '404' { Write-Error "Apple VPP Account not found." }
                default { Write-Error "$_" }
            } 
        }
    }
}