function New-UEMAttestApplicationRequestBody {
    
    <#
    .SYNOPSIS

    Function generates a request body for specific API Endpoint.

    .DESCRIPTION

    Function generates a request body for specific API Endpoint.

    .PARAMETER Type
    Possible values: SAFETYNET, HARDWARE_KEY or APP_INTEGRITY

    .INPUTS

    None.

    .OUTPUTS

    JSON. Returns an json formatted request body.

    .EXAMPLE

    New-UEMAttestApplicationRequestBody -type SAFETYNET
    #>

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$type
    )

    $RequestBody = @{
        'type' = 'ATTEST_APPLICATION'
        'properties' = @{
            'type' = $type
        }
    } | ConvertTo-Json

    write-output $RequestBody
}

function New-UEMBlockApplicationRequestBody {

    <#
    .SYNOPSIS

    Function generates a request body for specific API Endpoint.

    .DESCRIPTION

    Function generates a request body for specific API Endpoint.

    .PARAMETER actionId
    A unique identifier for any Block action. Can be any value as long as it is unique. 
    When sending a corresponding UNBLOCK_APPLICATION command later on, the same value must be used to correlate the commands.

    .PARAMETER title
    Title of the message that indicates that the device is in a blocked state (optional).

    .PARAMETER body
    Detailed message that displays on the same screen as the title. 
    For example, the message can provide steps to follow to get the device back in compliance (optional).

    .INPUTS

    None.

    .OUTPUTS

    JSON. Returns an json formatted request body.

    .EXAMPLE

    New-UEMBlockApplicationRequestBody -actionid $actionid -title $title -body $body
    #>

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$actionId,
        [Parameter(Mandatory = $true)]
        [string]$title,
        [Parameter(Mandatory = $true)]
        [string]$body
    )

    $RequestBody = @{
        'type' = 'BLOCK_APPLICATION'
        'properties' = @{
            'actionId' = $actionId
            'title' = $title
            'body' = $body
        }
    } | ConvertTo-Json     

    write-output $RequestBody
}

function New-UEMUnblockApplicationRequestBody {

    <#
    .SYNOPSIS

    Function generates a request body for specific API Endpoint.

    .DESCRIPTION

    Function generates a request body for specific API Endpoint.

    .PARAMETER actionId
    This must be the same value that was used in the preceding and related BLOCK_APPLICATION action(s). 
    No format or value restrictions apply. If more than one actionIds were sent in more than one BLOCK_APPLICATION calls, 
    all actionIDs used must be sent in separate calls to unblock the application (order of calls is not important for this).

    .INPUTS

    None.

    .OUTPUTS

    JSON. Returns an json formatted request body.

    .EXAMPLE

    New-UEMUnblockApplicationRequestBody -actionid $actionid
    #>

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$actionId
    )

    $RequestBody = @{
        'type' = 'UNBLOCK_APPLICATION'
        'properties' = @{
            'actionId' = $actionId
        }
    } | ConvertTo-Json 

    write-output $RequestBody
}

function New-UEMLockApplicationRequestBody {

    <#
    .SYNOPSIS

    Function generates a request body for specific API Endpoint.

    .DESCRIPTION

    Function generates a request body for specific API Endpoint.

    .INPUTS

    None.

    .OUTPUTS

    JSON. Returns an json formatted request body.

    .EXAMPLE

    New-UEMLockApplicationRequestBody
    #>

    [CmdletBinding()]
    Param()

    $RequestBody = @{
        'type' = 'LOCK_APPLICATION'
    } | ConvertTo-Json

    write-output $RequestBody
}

function New-UEMDeleteApplicationRequestBody {

    <#
    .SYNOPSIS

    Function generates a request body for specific API Endpoint.

    .DESCRIPTION

    Function generates a request body for specific API Endpoint.

    .INPUTS

    None.

    .OUTPUTS

    JSON. Returns an json formatted request body.

    .EXAMPLE

    New-UEMDeleteApplicationRequestBody
    #>

    [CmdletBinding()]
    Param()

    $RequestBody = @{
        'type' = 'DELETE_APPLICATION'
    } | ConvertTo-Json

    write-output $RequestBody
}

function New-UEMDeleteWorkSpaceDataRequestBody {

    <#
    .SYNOPSIS

    Function generates a request body for specific API Endpoint.

    .DESCRIPTION

    Function generates a request body for specific API Endpoint.

    .INPUTS

    None.

    .OUTPUTS

    JSON. Returns an json formatted request body.

    .EXAMPLE

    New-UEMDeleteWorkSpaceDataRequestBody
    #>

    [CmdletBinding()]
    Param()

    $RequestBody = @{
        'type' = 'DELETE_WORK_SPACE_DATA'
    } | ConvertTo-Json

    write-output $RequestBody
}

function New-UEMRemoveDeviceRequestBody {

    <#
    .SYNOPSIS

    Function generates a request body for specific API Endpoint.

    .DESCRIPTION

    Function generates a request body for specific API Endpoint.

    .INPUTS

    None.

    .OUTPUTS

    JSON. Returns an json formatted request body.

    .EXAMPLE

    New-UEMRemoveDeviceRequestBody
    #>

    [CmdletBinding()]
    Param()

    $RequestBody = @{
        'type' = 'REMOVE_DEVICE'
    } | ConvertTo-Json

    write-output $RequestBody
}

Function New-UEMApplicationGroupAppsRequestBody{
    Param(
        [string[]]$guidArray
    )
    $depDevices = @()

    foreach ($guid in $guidArray) {
        $applications += @{ 'guid' = $guid }
    }

    $RequestBody = @{
        'applications' = $depDevices
    } | ConvertTo-Json -Depth 2

    Write-Output $RequestBody
}

function New-BBUEMApplicationGroupsRequestBody {

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$name,

        [Parameter(Mandatory = $false)]
        [string]$description
    )
    if($description){
        $RequestBody = @{
            'name' = $name
            'description' = $description
        } | ConvertTo-Json
    }
    else{
        $RequestBody = @{
            'name' = $name
        } | ConvertTo-Json
    }

    write-output $RequestBody
}