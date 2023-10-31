function Search-BBUEMApplicationGroups {

    <#
    .SYNOPSIS

    Function to Get all application groups or application groups with a specific query. 
    If no application groups are found, an empty application group list is included in the response body.

    .DESCRIPTION

    This function Get all application groups or application groups with a specific query. 
    If no application groups are found, an empty application group list is included in the response body.

    .PARAMETER name
    Name of the application group. Case insensitive exact match.

    .INPUTS

    None.

    .OUTPUTS

    unknown

    .EXAMPLE

    Search-BBUEMApplicationGroups -name 'TestAppGroup'

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_getAppGroups_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [string]$name
    )

    $method = 'Get'
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applicationgroups-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups?query=name=$name"

    Write-Debug "URI: $api_url"
    Write-Debug "Headers: $headers"
    Write-Debug "Method: $method"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid search query."}
            default {Write-Error "$_"}
        } 
    }
}

function New-BBUEMApplicationGroup {

    <#
    .SYNOPSIS

    Function to Create an application group. Only the name field of the group is required. The description field is optional. 

    .DESCRIPTION

    This function Creates an application group. Only the name field of the group is required. The description field is optional. 

    .PARAMETER name
    The application group name.

    .PARAMETER description
    The application group description.

    .INPUTS

    None.

    .OUTPUTS

    unknown

    .EXAMPLE

    New-BBUEMApplicationGroup -name $app_group_name -description $description

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_create_POST

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [string]$name,

        [Parameter(Mandatory = $false)]
        [string]$description
    )

    $method = 'Post'
    $Headers = @{
        'Content-type' = 'application/vnd.blackberry.applicationgroup-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups"
    If($description){
        $body = New-BBUEMApplicationGroupsRequestBody -name $name -description $description
    }
    else{
        $body = New-BBUEMApplicationGroupsRequestBody -name $name
    }

    Write-Debug "URI: $api_url"
    Write-Debug "Headers: $headers"
    Write-Debug "Method: $method"
    Write-Debug "Body: $body"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method -Body $body
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
            '409' {Write-Error "Application group already exists."}
            default {Write-Error "$_"}
        } 
    }
}

function Get-BBUEMApplicationGroup {

    <#
    .SYNOPSIS

    Function to retrieve an application group.

    .DESCRIPTION

    This function retrieves an application group.

    .PARAMETER app_group_guid
    The guid of the application group to retrieve.

    .INPUTS

    None.

    .OUTPUTS

    unknown

    .EXAMPLE

    Get-BBUEMApplicationGroup -app_group_guid $guid

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_getAppGroup_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$app_group_guid
    )

    $method = 'Get'
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applicationgroup-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups/$app_group_guid"

    Write-Debug "URI: $api_url"
    Write-Debug "Headers: $headers"
    Write-Debug "Method: $method"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "Application group not found."}
            default {Write-Error "$_"}
        } 
    }
}

function Remove-BBUEMApplicationGroup {

    <#
    .SYNOPSIS

    Function to delete an application group.

    .DESCRIPTION

    This function deletes an application group.

    .PARAMETER app_group_guid
    The guid of the application group to delete.

    .INPUTS

    None.

    .OUTPUTS

    unknown

    .EXAMPLE

    Remove-BBUEMApplicationGroup -app_group_guid $guid

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_deleteApplicationGroup_DELETE

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$app_group_guid
    )

    $method = 'Delete'
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applicationgroup-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups/$app_group_guid"

    Write-Debug "URI: $api_url"
    Write-Debug "Headers: $headers"
    Write-Debug "Method: $method"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "Application group not found."}
            default {Write-Error "$_"}
        } 
    }
}

function Set-BBUEMApplicationGroup {

    <#
    .SYNOPSIS

    Function to Update an existing application group. Name or description should be provided.

    .DESCRIPTION

    This function Updates an existing application group. Name or description should be provided.

    .PARAMETER app_group_guid
    The application group identifier.

    .PARAMETER name
    The application group name to update.

    .PARAMETER description
    The application group name to update.

    .INPUTS

    None.

    .OUTPUTS

    unknown

    .EXAMPLE

    Set-BBUEMApplicationGroup -app_group_id $guid -name 'New App group Name'

    .EXAMPLE

    Set-BBUEMApplicationGroup -app_group_id $guid -description 'New App group Description'

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_update_PUT
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$app_group_guid,

        [Parameter(Mandatory = $true)]
        [string]$name,

        [Parameter(Mandatory = $false)]
        [string]$description
    )

    $method = 'Put'
    $Headers = @{
        'Content-Type' = 'application/vnd.blackberry.applicationgroup-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups/$app_group_guid"

    If($description){
        $body = New-BBUEMApplicationGroupsRequestBody -name $name -description $description
    }
    else{
        $body = New-BBUEMApplicationGroupsRequestBody -name $name
    }

    Write-Debug "URI: $api_url"
    Write-Debug "Headers: $headers"
    Write-Debug "Method: $method"
    Write-Debug "Body: $body"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method -Body $body
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
            '404' {Write-Error "Application group not found."}
            '409' {Write-Error "Application group already exists."}
            default {Write-Error "$_"}
        } 
    }
}

function Get-ApplicationGroupApps {

    <#
    .SYNOPSIS

    Function to Get all the applications assigned to an application group by a specific GUID. 

    .DESCRIPTION

    This function Gets all the applications assigned to an application group by a specific GUID. 

    .PARAMETER app_group_guid
    The application group identifier.

    .INPUTS

    None.

    .OUTPUTS

    unknown

    .EXAMPLE

    Get-ApplicationGroupApps -app_group_id $guid

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_getApplications_GET

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$app_group_guid
    )

    $method = 'Get'
    $Headers = @{
        'Accept' = 'application/vnd.blackberry.applications-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups/$app_group_guid/applications"

    Write-Debug "URI: $api_url"
    Write-Debug "Headers: $headers"
    Write-Debug "Method: $method"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '404' {Write-Error "Application group not found."}
            default {Write-Error "$_"}
        } 
    }
}

function Add-ApplicationGroupApps {

    <#
    .SYNOPSIS

    Function to Add applications to an application group.

    The application GUID is used to identify the applications that will be added to the application group. All other fields will be ignored if they are provided. 

    .DESCRIPTION

    Function to Add applications to an application group.

    The application GUID is used to identify the applications that will be added to the application group. All other fields will be ignored if they are provided.

    .PARAMETER app_group_guid
    The application grup identifier.

    .PARAMETER application_guids
    The application guids.

    .INPUTS

    None.

    .OUTPUTS

    unknown

    .EXAMPLE

    Add-ApplicationGroupApps -app_group_guid $app_group_guid -application_guids $app_guids

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_addApplications_POST

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$app_group_guid,

        [Parameter(Mandatory = $true)]
        [System.guid[]]$application_guids
    )

    $method = 'Post'
    $Headers = @{
        'Content-Type' = 'application/vnd.blackberry.applications-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups/$app_group_guid/application"
    $body = New-UEMApplicationGroupAppsRequestBody -guidarray $application_guids

    Write-Debug "URI: $api_url"
    Write-Debug "Headers: $headers"
    Write-Debug "Method: $method"
    Write-Debug "Body: $body"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method -Body $body
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

    <#
    .SYNOPSIS

    Function to Replace all applications in an application group.

    The application GUID is used to identify the applications that will be replacing all the existing applications in the application group. All other fields will be ignored if they are provided. 

    .DESCRIPTION

    Function to Replace all applications in an application group.

    The application GUID is used to identify the applications that will be replacing all the existing applications in the application group. All other fields will be ignored if they are provided. 


    .PARAMETER app_group_guid
    The application group identifier.

    .PARAMETER application_guids
    The list of application guids.

    .INPUTS

    None.

    .OUTPUTS

    unknown

    .EXAMPLE

    Set-ApplicationGroupApps -app_group_guid $app_group_guid -application_guids $application_guids

    .LINK

    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_replaceAllApplications_PUT

    #>

    Param(
        [Parameter(Mandatory = $true)]
        [System.Guid]$app_group_guid,

        [Parameter(Mandatory = $true)]
        [System.guid[]]$application_guids
    )

    $method = 'Post'
    $Headers = @{
        'Content-Type' = 'application/vnd.blackberry.applications-v1+json'
        'Authorization' = $global:env:uem_auth_token
    }

    $api_url = $global:env:uem_environment + "/applicationGroups/$app_group_guid/applications"
    $body = New-UEMApplicationGroupAppsRequestBody -guidarray $application_guids

    Write-Debug "URI: $api_url"
    Write-Debug "Headers: $headers"
    Write-Debug "Method: $method"
    Write-Debug "Body: $body"

    try {
        Invoke-IgnoreCertForPS5
        $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method $method -Body $body
        return $Response
    }
    catch {
        Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
            '400' {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
            '404' {Write-Error "Application group or application not found."}
            default {Write-Error "$_"}
        } 
    }
}