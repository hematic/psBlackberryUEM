# psBlackberryUEM
PowerShell Module to interact with the BlackBerry UEM API

# Current Release Notes (1.0.13)
I had done a bad job of the return values from some functions.
I had re-used code as was returning properties of the response object that didnt exist for some endpoints. This has been fixed.



# Description

Automate tasks with the Blackberry UEM API using psBlackberryUEM!

This project hopes to offer complete code coverage for the [Blackberry UEM API](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/)

As of Release Version [1.0.13](https://www.powershellgallery.com/packages/WC-BlackberryUEM/1.0.13) the below table reflects the current code coverage.

|Endpoint|Code Coverage|Help|Tested|
|-|-|-|-|
|APNs|Complete|Complete|ToDo|
|Apple DEP|Complete|Complete|ToDo|
|Apple VPP Account|Complete|Complete|ToDo|
|Application Groups|Complete|Complete|ToDo|
|Application Servers|Complete|Complete|ToDo|
|Application Configs|Partial|ToDo|ToDo|
|Applications|Complete|Complete|Complete|
|Certificates|ToDo|ToDo|ToDo|
|Clusters|Complete|Complete|ToDo|
|Company Directories|Complete|Complete|ToDo
|Custom Variables|Complete|Complete|ToDo|
|Device Groups|ToDo|ToDo|ToDo|
|Devices|Complete|Complete|ToDo|
|Email Templates|ToDo|ToDo|ToDo|
|Entities|ToDo|ToDo|ToDo|
|Groups|ToDo|ToDo|ToDo|
|Info|Complete|Complete|ToDo|
|Licensing|Complete|Complete|ToDo|
|Ping|Complete|Complete|ToDo|
|Profiles|ToDo|ToDo|ToDo|
|Roles|Complete|Complete|ToDo|
|Servers|Complete|Complete|ToDo|
|Shared Device Groups|Complete|Complete|ToDo|
|Users|Partial|Partial|ToDo|
|Utilities|Complete|Complete|ToDo|


# Basic Usage
## Installation
```
Install-Module -Name psBlackberryUEM -Repository PSGallery -Force -Scope CurrentUser
```
## API Authentication
When working with an API the first thing you most always need to do is authenticate.
psBlackBerryUEM uses a function **Get-BBUEMAuthString**.

You call this function like so:

```
Get-BBUEMAuthString -Credential <This is a PSCredential OBject> -base_uri <The base part of the URI for your instance. Example: https://server:port/tenantID/api/v1>
```
Instead of returning an object or string to you, this function sets two **Global** scoped variables that are used elsewhere throughout the module.
```
$global:env:uem_environment: This is used to construct the full URI for every other endpoint the module hits.

$global:env:uem_auth_token: This is the Auth Token that is passed in the header for every subsequent call that is made. All of the functions handle passing this for you.
```

Once this basic command has been run, all other functions are available to you. If you need to use different credentials for different endpoints, you will need to re-authenticate between those calls with whatever credential is needed.
