function Search-Devices {

    <#
    .SYNOPSIS
    Function to Search for devices. 

    .DESCRIPTION
    Function to Search for devices. 

    .PARAMETER activation_date
    Date value in ISO-8601 format yyyy-MM-ddTHH:mm:ss.SSSZ. Use operators > or >= for the minimum date, and/or < or <= for the maximum date. For example: activationDate>=1970-01-01T00:00:00.000Z,activationDate<=1970-12-31T23:59:59.000Z.

    .PARAMETER operator
    "Less Than", "Less Than Or Equal To", "Greater Than", "Greater Than Or Equal To"

    .PARAMETER dynamics_container_id
    Identifier of a Dynamics container that is activated on a device. When searching by a BlackBerry Dynamics container Id, response will additionally contain user-device application route link that corresponds to the Dynamics application to which the container belongs and the user who owns the device.

    .PARAMETER guid
    GUID of the device.

    .PARAMETER imei
    IMEI of the device.

    .PARAMETER meid
    MEID of the device.

    .PARAMETER ownership
    'CORPORATE' or 'PERSONAL'

    .PARAMETER udid
    UDID of the device.

    .PARAMETER wifi_mac_address
    WIFI MAC address of the device.

    .PARAMETER shared_device_only
    Filter to return only devices that are part of shared device groups. If filter is not specified then all the devices will be returned

    .PARAMETER os
    The operating system of the device.

    .PARAMETER os_family_name
    The operating system family name of the device.

    .PARAMETER hardware_model
    The hardware model of the device.

    .PARAMETER hardware_vendor_company_name
    The hardware vendor company name of the device.    

    .PARAMETER enrollment_type
    The enrollment type of the device.

    .PARAMETER include_total
    If you want the total number of devices matching the search included in the response (which may be different from the number of devices actually returned) set this to true; otherwise set to false. By default the total will not be included in the response.    

    .PARAMETER max
    The maximum number of device results to get, between 1 and 1000 inclusive. If not specified, a value of 100 will be used.

    .PARAMETER offset
    The number of matching devices to exclude from the beginning of the list of devices in the response; greater than or equal to 0. If not specified, a value of 0 will be used to indicate that no matches should be excluded. Used in order to get "pages" of results. For example, to get the first 50 matching devices, specify max=50 (and optionally offset=0); and to get the next 50 matching devices specify max=50 and offset=50, and so on.    

    .EXAMPLE
    Search-Devices -guid '714a8084-a059-4fbc-91c3-99daea0d0fb8' -activation_date $date -operator "Less Than Or Equal To" -max 25

    .EXAMPLE
    Search-UEMAPiUser -user 'stephan*' -offset 10

    .LINK
    https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Devices.html#resource_Devices_getDevices_GET
    #>

    param(
        [Parameter(Mandatory = $False)]
        [Datetime] $activation_date,

        [ValidateSet("Less Than", "Less Than Or Equal To", "Greater Than", "Greater Than Or Equal To")]
        [string] $operator,

        [Parameter(Mandatory = $False)]
        [string] $dynamics_container_id,

        [Parameter(Mandatory = $False)]
        [System.Guid] $guid,

        [Parameter(Mandatory = $False)]
        [string] $imei,

        [Parameter(Mandatory = $False)]
        [string] $meid,

        [Parameter(Mandatory = $False)]
        [string] $ownership,

        [Parameter(Mandatory = $False)]
        [string] $udid,

        [Parameter(Mandatory = $False)]
        [string] $wifi_mac_address,

        [Parameter(Mandatory = $False)]
        [Bool] $shared_device_only,

        [Parameter(Mandatory = $False)]
        [string] $os,

        [Parameter(Mandatory = $False)]
        [string] $os_family_name,

        [Parameter(Mandatory = $False)]
        [string] $hardware_model,

        [Parameter(Mandatory = $False)]
        [string] $hardware_vendor_company_name,

        [Parameter(Mandatory = $False)]
        [ValidateSet("EXTERNAL_SERVICE", "FULL_CONTROL_KNOX","MDM_CONTROLS","STRONG_AUTHENTICATION_BY_BLACKBERRY",
                     "USER_PRIVACY","USER_PRIVACY_AFW","USER_PRIVACY_AFW_PREMIUM","USER_PRIVACY_DYNAMICS","USER_PRIVACY_KNOX",
                     "USER_PRIVACY_USER_ENROLLMENT","USER_PRIVACY_WITH_PROFILES","WORK_AND_PERSONAL_CORPORATE",
                     "WORK_AND_PERSONAL_REGULATED","WORK_SPACE_ONLY","WORK_SPACE_ONLY_AFW","WORK_SPACE_ONLY_AFW_PREMIUM","WORK_SPACE_ONLY_KNOX")]
        [string] $enrollment_type,

        [Parameter(Mandatory = $False)]
        [bool] $include_total = $false,

        [Parameter(Mandatory = $False)]
        [ValidateRange(1, 1000)]
        [int] $max = 100,

        [Parameter(Mandatory = $False)]
        [ValidateRange(0, 50)]
        [int] $offset = 0
    )

    begin {
        Write-Debug "Entering Function: $($MyInvocation.MyCommand)"
        $method = 'Get'
        $Headers = @{
            'Accept'        = 'application/vnd.blackberry.devices-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }

        $base_url = $global:env:uem_environment + "/devices?query="
        $query = New-DeviceQuery -search_params $PSBoundParameters -ErrorAction Stop
        $api_url = $base_url + $query

        Write-Debug "URI: $api_url"
        Write-Debug "Headers: $headers"
        Write-Debug "Method: $method"
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Method
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' { Write-Error "Invalid Search Query" }
                default { Write-Error "$_" }
            } 
        }
    }
}