function Search-CompanyDirectories {
    <#
    .SYNOPSIS
    Function to search the blackberry uem api by username with pagination.

    .DESCRIPTION
    Search for users in all configured company directories. This will most 
    often be used in order to create a directory-linked user (see the "Users" 
    resource for creating a directory-linked user). 

    .PARAMETER query_value
    A required non-empty value to search for directory users, using a 
    case-insensitive prefix match. For AD company directories, an Ambiguous 
    Name Resolution (ANR) search is performed. For LDAP company directories, 
    the search is performed across various configured fields, for example 
    displayName, emailAddress, firstName, lastName, username.

    .PARAMETER limit
    The maximum number of matching directory users to get. 
    If specified, the value must be between 1 and 100, inclusive. 
    Defaults to 100 if not provided.

    .PARAMETER include_existing_users
    The maximum number of matching directory users to get. 
    If specified, the value must be between 1 and 100, inclusive. 
    Defaults to 100 if not provided.

    .EXAMPLE
    Search-CompanyDirectories -query_value 'marshall' -limit 50 -include_existing_users $true


    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Company_directories.html#resource_Company_directories_getUsers_GET
    #>

    Param(
        [Parameter(Mandatory = $true)]
        [string]$query_value,

        [Parameter(Mandatory = $false)]
        [ValidateRange(1,100)]
        [int]$limit = 100,

        [Parameter(Mandatory = $false)]
        [bool]$include_existing_users = $false
    )
    Begin{
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $rest_params = Get-RestParams -method 'Get' -media_type 'shareddevicegroups' -endpoint "/directories/users?search=$query_value&limit=$limit&includeExistingUsers=$include_existing_users"
    }
    Process{
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $rest_params.api_url -Headers $rest_params.headers -Method $rest_params.method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' {Write-Error "Invalid request. For example, invalid field semantics or missing required field."}
                '409' {Write-Error "No company directories configured."}
                default {Write-Error "$_"}
            } 
        }
    }
}