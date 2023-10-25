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