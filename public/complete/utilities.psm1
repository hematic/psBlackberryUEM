function Get-BBUEMAuthString {

    <#
    .SYNOPSIS

    This function generates a API Auth token for Blackberry UEM.

    .DESCRIPTION

    The API Auth token gets set as a global variable: $global:env:uem_auth_token
    The function also sets a base api url string for connecting to the environment.
    That global variable is: $global:env:uem_environment. This allows for cleaner
    uri strings in the other functions without needing to support dev and prod each time.

    .PARAMETER Credential
    Specifies the credential for connecting to the API.

    .PARAMETER Environment
    The user must pass in the base part of the api url.
    In the format of : https://server:port/tenantID/api/v1

    .INPUTS

    None.

    .OUTPUTS

    None.

    .EXAMPLE

    Get-UEMApiAuthString -Credential $Credential -Environment https://server:port/tenantID/api/v1

    .EXAMPLE

    Get-UEMApiAuthString -Credential (get-credential) -Environment $prod

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Utilities.html#resource_Utilities_generateAuthorizationHeader_POST
    #>

    param (
        [Parameter(Mandatory = $true)]
        [pscredential]$Credential,
        
        [Parameter(Mandatory = $true,
        HelpMessage="Enter in the format of https://server:port/tenantID/api/v1")]
        [string]$base_uri
    )

        $api_url = $base_uri + '/util/authorization'
        $global:env:uem_environment = $base_uri
    
    $method = 'Post'
    $Headers = @{
        'Content-Type' = 'application/vnd.blackberry.authorizationrequest-v1+json'
    }

    $EncodedPassword = Convert-SecureStringtoBase64 -credential $credential

    $RequestBody = @{
        'provider' = 'AD'
        'username' = $Credential.Username
        'password' = $EncodedPassword
        'domain' = 'WCNET'
    } | ConvertTo-Json
    
    try {

        Write-Debug "URI: $api_url"
        Write-Debug "Headers: $headers"
        Write-Debug "Method: $method"
        Write-Debug "Body: $requestbody"

        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method -Body $RequestBody
        $global:env:uem_auth_token = $response
    }
    catch {
        Write-Host "Authentication failed: $($_.Exception.Message)"
        return $null
    }
}