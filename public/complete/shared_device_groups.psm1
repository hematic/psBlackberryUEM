function Get-SharedDeviceGroups {

    Param(
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.shareddevicegroups-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/sharedDeviceGroups"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400'   {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Get-SharedDeviceGroupByGuid {

    Param(
        [Parameter(mandatory=$true)]
        [System.Guid]$guid
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.shareddevicegroup-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/sharedDeviceGroups/$guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400'   {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
            '404'   {Write-Error "Shared device group not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Get-SharedDeviceGroupDevices {

    Param(
        [Parameter(mandatory=$true)]
        [System.Guid]$guid
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.userdevices-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/sharedDeviceGroups/$guid/userDevices"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400'   {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
            '404'   {Write-Error "Shared device group not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Get-SharedDeviceGroupDevices {

    Param(
        [Parameter(mandatory=$true)]
        [System.Guid]$group_guid,

        [Parameter(mandatory=$true)]
        [System.Guid]$device_guid
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.userdevice-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/sharedDeviceGroups/$group_guid/userDevices/$device_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400'   {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
            '404'   {Write-Error "Shared device group not found or Device Not Found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}
