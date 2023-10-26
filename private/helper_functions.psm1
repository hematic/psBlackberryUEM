Function Invoke-IgnoreCertForPS5 {
    <#
    .SYNOPSIS

    Function to bypass self-signed/internally signed certs.

    .DESCRIPTION

    On PS 6.0 and up you can just use -SkipCertificateCheck. Unfortunately PS 5.1
    doesn't have this flag. So i fell back to this model. 

    .INPUTS

    None.

    .OUTPUTS

    None.

    .EXAMPLE

    Invoke-IgnoreCertForPS5


    .LINK

    https://stackoverflow.com/questions/36456104/invoke-restmethod-ignore-self-signed-certs

    #>


    if (-not ([System.Management.Automation.PSTypeName]'ServerCertificateValidationCallback').Type){
        $certCallback = @"
using System;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
public class ServerCertificateValidationCallback
{
    public static void Ignore()
    {
        if(ServicePointManager.ServerCertificateValidationCallback ==null)
        {
            ServicePointManager.ServerCertificateValidationCallback += 
                delegate
                (
                    Object obj, 
                    X509Certificate certificate, 
                    X509Chain chain, 
                    SslPolicyErrors errors
                )
                {
                    return true;
                };
        }
    }
}
"@
            Add-Type $certCallback
        }

    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    [ServerCertificateValidationCallback]::Ignore()

}

function Convert-SecureStringtoBase64 {

    <#
    .SYNOPSIS

    Function accepts a credential object and returns a base64 encoded string of the password.

    .DESCRIPTION

    Function accepts a credential object and returns a base64 encoded string of the password.

    .PARAMETER Credential
    Specifies the credential to convert.

    .INPUTS

    None.

    .OUTPUTS

    System.String. Base64encoded string representing the password.

    .EXAMPLE

    $EncodedPassword = Convert-SecureStringtoBase64 -credential $credential

    .LINK

    https://stackoverflow.com/questions/74143120/convert-system-security-securestring-to-base64string

    #>

    param (
        [Parameter(Mandatory = $true)]
        [pscredential]$credential
    )
    $binary_string = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($($credential.password))
    $plain_text_string = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($binary_string)
    $EncodedPassword = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($plain_text_string))
    write-output $EncodedPassword
}

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

function New-AppConfigQuery {
    Param (
        [Parameter(Mandatory = $True)]
        [hashtable]$search_params
    )

    $queryComponents = @()

    If($search_params.keys -contains 'app_name'){
        $queryComponents += $("appName=" + $search_params['app_name'])
    }

    If($search_params.keys -contains 'app_package_id'){
        $queryComponents += $("appPackageId=" + $search_params['app_package_id'])
    }

    If($search_params.keys -contains 'app_guid'){
        $queryComponents += $("appGuid=" + $search_params['app_guid'])
    }

    If($search_params.keys -contains 'guid'){
        $queryComponents += $("guid=" + $search_params['guid'])
    }

    If($search_params.keys -contains 'name'){
        $queryComponents += $("name=" + $search_params['name'])
    }

    If($search_params.keys -contains 'rank'){
        $queryComponents += $("rank=" + $search_params['rank'])
    }

    $query_string = [String]::Join(",", $queryComponents)


    If($search_params.keys -contains 'max'){
        $query_string = $query_string + $("&max=" + $search_params['max'])
    }

    Write-Output $query_string
}