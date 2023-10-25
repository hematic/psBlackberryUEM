function Search-BBUEMApplicationGroups {

    Param(
        [Parameter(Mandatory = $true)]
        [string]$name
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applicationgroups-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups?query=name=$name"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response.users
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid search query."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function New-BBUEMApplicationGroup {

    Param(
        [Parameter(Mandatory = $true)]
        [string]$name,

        [Parameter(Mandatory = $false)]
        [string]$description
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applicationgroup-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups"
    If($description){
        $body = New-BBUEMApplicationGroupsRequestBody -name $name -description $description
    }
    else{
        $body = New-BBUEMApplicationGroupsRequestBody -name $name
    }

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Post -Body $body
        return $Response.users
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
            '409' {Write-Error "Application group already exists."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Remove-BBUEMApplicationGroup {

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$app_group_guid
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applicationgroup-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups/$app_group_guid"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Delete
        return $Response.users
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '409' {Write-Error "Application group not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Set-BBUEMApplicationGroup {

    Param(
        [Parameter(Mandatory = $true)]
        [string]$app_group_guid,

        [Parameter(Mandatory = $true)]
        [string]$name,

        [Parameter(Mandatory = $false)]
        [string]$description
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applicationgroup-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups/$app_group_guid"

    If($description){
        $body = New-BBUEMApplicationGroupsRequestBody -name $name -description $description
    }
    else{
        $body = New-BBUEMApplicationGroupsRequestBody -name $name
    }

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Put -Body $body
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
            '404' {Write-Error "Application group not found."}
            '409' {Write-Error "Application group already exists."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Get-ApplicationGroupApps {

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$app_group_guid
    )
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applications-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups/$app_group_guid/applications"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "Application group not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Add-ApplicationGroupApps {

    Param(
        [Parameter(Mandatory = $true)]
        [string]$app_group_guid,

        [Parameter(Mandatory = $true)]
        [System.guid[]]$application_guids
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applications-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups/$app_group_guid/application"
    $body = New-UEMApplicationGroupAppsRequestBody -guidarray $application_guids

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Post -Body $body
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
            '404' {Write-Error "Application group or application not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}

function Set-ApplicationGroupApps {

    Param(
        [Parameter(Mandatory = $true)]
        [string]$app_group_guid,

        [Parameter(Mandatory = $true)]
        [System.guid[]]$application_guids
    )

    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applications-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups/$app_group_guid/applications"
    $body = New-UEMApplicationGroupAppsRequestBody -guidarray $application_guids

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Post -Body $body
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
            '404' {Write-Error "Application group or application not found."}
            default {Write-Error "Authentication failed: $_"}
        } 
    }
}