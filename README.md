# psBlackberryUEM
PowerShell Module to interact with the BlackBerry UEM API

## Please note this module is still in its active development stage. 

- Not all endpoints are yet supported.
- The endpoints that are supported may have bugs.
- Please use caution when utilizing this module against production environments.

# Current Release Notes (1.0.19)
- Fixed two issues with Get-RestParams stopping it from returning proper otuput.
- 
# Current Release Notes (1.0.18)
- Converted all functions over to calling Get-RestParams for standardization of the API calls.


# Description

Automate tasks with the Blackberry UEM API using psBlackberryUEM!

This project hopes to offer complete code coverage for the [Blackberry UEM API](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/)

As of Release Version [1.0.19](https://www.powershellgallery.com/packages/psBlackberryUEM/1.0.19) the below table reflects the current code coverage.

|Endpoint|Code Coverage|Help|SupportsDebug|HasTests
|-|-|-|-|-|
|APNs|Complete|Complete|Complete|ToDo
|Apple DEP|Complete|Complete|Complete|ToDo
|Apple VPP Account|Complete|Complete|Complete|ToDo
|Application Groups|Complete|Complete|Complete|ToDo
|Application Servers|Complete|Complete|Complete|ToDo
|Application Configs|Partial|ToDo|Partial|ToDo
|Applications|Complete|Complete|Complete|ToDo
|Certificates|ToDo|ToDo|ToDo|ToDo
|Clusters|Complete|Complete|Complete|ToDo
|Company Directories|Complete|Complete|Complete|ToDo
|Custom Variables|Complete|Complete|Complete|ToDo|
|Device Groups|ToDo|ToDo|ToDo|ToDo
|Devices|Complete|Complete|Complete|ToDo|
|Email Templates|ToDo|ToDo|ToDo|ToDo
|Entities|ToDo|ToDo|ToDo|ToDo
|Groups|ToDo|ToDo|ToDo|ToDo
|Info|Complete|Complete|Complete|ToDo
|Licensing|Complete|Complete|Complete|ToDo
|Ping|Complete|Complete|Complete|ToDo
|Profiles|ToDo|ToDo|ToDo|ToDo|
|Roles|Complete|Complete|Complete|ToDo
|Servers|Complete|Complete|Complete|ToDo
|Shared Device Groups|Complete|Complete|Complete|ToDo|
|Users|Partial|Partial|ToDo|ToDo
|Utilities|Complete|Complete|Complete|ToDo|


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

##Example Calls

```
Search-User -user 'mobil*'
```

In this case the API may return more than one result.

The result comes back as an [array] of users, If no users are found matching the search pattern an empty array is returned.

```
username          : mobilap1
displayName       : ZZ_test_Mob_AP1
firstName         : ZZ_test_Mob_AP1
lastName          : Test
emailAddress      : Mobilap1@contoso.com
links             : {@{rel=groups; href=https://<private>:18084/S81230813/api/v1/users/8ce4d77e-8591-4815-9503-025a0fdb8129/groups}, @{rel=profiles; href=https://<private>:18084/S81230813/api/v1/users/8ce4d77e-8591-4815-9503-025a0fdb8129/profiles}}
guid              : 8ce4d77e-8591-4815-9503-025a0fdb8129
ecoid             : AmymJWcn7QhKeKvoJK41mvA=
directoryId       : 9d50ddc7df704a4d8cbfa4cc31d748f7
company           : <private>
title             : Senior Support Engineer
department        : GTS
mobilePhoneNumber : +88 88 8888 8888
admin             : False
created           : 2021-03-01T08:00:33.152Z

username          : Mobilam1
displayName       : ZZ_test_Mob_AM1
firstName         : ZZ_test_Mob_AM1
lastName          : Test
emailAddress      : Mobilam1@<private>.com
links             : {@{rel=groups; href=https://<private>:18084/S81230813/api/v1/users/db7c8555-17c2-46b4-be55-86d567f4f7cc/groups}, @{rel=profiles; href=https://<private>:18084/S81230813/api/v1/users/db7c8555-17c2-46b4-be55-86d567f4f7cc/profiles}}
guid              : db7c8555-17c2-46b4-be55-86d567f4f7cc
ecoid             : AmeI8qScEpYR/MXNUIEByJ8=
directoryId       : 1fd613b0e8643a40a99b0ae3224791d9
company           : <private>
title             : Senior Support Engineer
department        : GTS
officePhoneNumber : +1 0000 00000
admin             : False
created           : 2022-11-10T09:31:31.052Z
```
