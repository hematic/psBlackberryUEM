function Get-BBUEMServers {

    Param(
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.servers-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/servers"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Get-BBUEMServerByGuid {

    Param(
        [Parameter(mandatory=$true)]
        [System.Guid]$server_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.server-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/servers/$server_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Get-BBUEMServiceByServer {

    Param(
        [Parameter(mandatory=$true)]
        [System.Guid]$server_guid,

        [Parameter(mandatory=$true)]
        [String]$type
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.service-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/servers/$server_guid/services/$type"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

#TODO
<#
    function Set-BBUEMServiceByServer {

        Param(
            [Parameter(mandatory=$true)]
            [System.Guid]$server_guid,

            [Parameter(mandatory=$true)]
            [String]$type
        )
        $Headers = @{
            'Accept' = 'application/vnd.blackberry.service-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }

        $api_url = $global:env:uem_environment + "/servers/$server_guid/services/$type"

        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Put
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                default {Write-Error "Authentication failed: $_"}
            } 
        }
    }
#>