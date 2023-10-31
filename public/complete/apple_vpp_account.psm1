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
    
        $rest_params = Get-RestParams -method 'Get' -media_type 'vppaccounts' -endpoint $("vppAccounts?query=" + [String]::Join(",", $queryComponents))
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.method
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
        $rest_params = Get-RestParams -method 'Get' -media_type 'vppaccount' -endpoint "/vppAccounts/$vpp_account_guid"
    }
    Process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.method
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