function New-DeviceQuery {
    Param (
        [Parameter(Mandatory = $True)]
        [hashtable]$search_params
    )

    $queryComponents = @()

    If($search_params.keys -contains 'activation_date'){
        If(!$search_params.keys -contains $operator){
            Write-Error "When passing an activation date you must always pass an operator parameter."
        }
        switch ($search_params['operator']) {
            "Less Than" { $operatorSymbol = "<" }
            "Less Than Or Equal To" { $operatorSymbol = "<=" }
            "Greater Than" { $operatorSymbol = ">" }
            "Greater Than Or Equal To" { $operatorSymbol = ">=" }
        }
        $queryComponents += $("activationDate" + $operatorSymbol + $search_params['activation_date'])
    }

    If($search_params.keys -contains 'dynamics_container_id'){
        $queryComponents += $("dynamicsContainerId=" + $search_params['dynamics_container_id'])
    }

    If($search_params.keys -contains 'guid'){
        $queryComponents += $("guid=" + $search_params['guid'])
    }

    If($search_params.keys -contains 'imei'){
        $queryComponents += $("imei=" + $search_params['imei'])
    }

    If($search_params.keys -contains 'meid'){
        $queryComponents += $("meid=" + $search_params['meid'])
    }

    If($search_params.keys -contains 'ownership'){
        $queryComponents += $("ownership=" + $search_params['ownership'])
    }

    If($search_params.keys -contains 'udid'){
        $queryComponents += $("udid=" + $search_params['udid'])
    }

    If($search_params.keys -contains 'wifi_mac_address'){
        $queryComponents += $("wifiMacAddress=" + $search_params['wifi_mac_address'])
    }

    If($search_params.keys -contains 'shared_device_only'){
        $queryComponents += $("sharedDeviceOnly=" + $search_params['shared_device_only'])
    }

    If($search_params.keys -contains 'os'){
        $queryComponents += $("os=" + $search_params['os'])
    }

    If($search_params.keys -contains 'os_family_name'){
        $queryComponents += $("osFamilyName=" + $search_params['os_family_name'])
    }

    If($search_params.keys -contains 'hardware_model'){
        $queryComponents += $("hardwareModel=" + $search_params['hardware_model'])
    }

    If($search_params.keys -contains 'hardware_vendor_company_name'){
        $queryComponents += $("hardwareVendorCompanyName=" + $search_params['hardware_vendor_company_name'])
    }

    If($search_params.keys -contains 'enrollment_type'){
        $queryComponents += $("enrollmentType=" + $search_params['enrollment_type'])
    }

    $query_string = [String]::Join(",", $queryComponents)


    If($search_params.keys -contains 'include_total'){
        $query_string = $query_string + $("&includeTotal=" + $search_params['include_total'])
    }

    If($search_params.keys -contains 'max'){
        $query_string = $query_string + $("&max=" + $search_params['max'])
    }

    If($search_params.keys -contains 'offset'){
        $query_string = $query_string +$("&offset=" + $search_params['offset'])
    }

    Write-Output $query_string
}

function Search-Devices {

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
        $Headers = @{
            'Accept'        = 'application/vnd.blackberry.devices-v1+json'
            'Authorization' = $global:env:uem_auth_token
        }

        $base_url = $global:env:uem_environment + "/devices?query="
        $query = New-DeviceQuery -search_params $PSBoundParameters -ErrorAction Stop
        $api_url = $base_url + $query

        Write-host $api_url
    }

    process {
        try {
            Invoke-IgnoreCertForPS5
            $Response = Invoke-RestMethod -Uri $api_url -Headers $Headers -Method Get
            return $Response
        }
        catch {
            Switch -Wildcard ($_.Exception.Response.StatusCode.value__) {
                '400' { Write-Error "Invalid Search Query" }
                default { Write-Error "Authentication failed: $_" }
            } 
        }
    }
}