---
external help file: users.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceApplications_GET
schema: 2.0.0
---

# Get-UserApps

## SYNOPSIS
Function to retrieve a user by it's GUID.

## SYNTAX

```
Get-UserApps [-user_guid] <Guid> [<CommonParameters>]
```

## DESCRIPTION
This function searches the Blackberry UEM API by GUID and returns the matching user.

## EXAMPLES

### EXAMPLE 1
```
Get-UEMAPiUserByGuid -user_guid 'db7c8555-17c2-46b4-be55-86d567f4f7cc'
```

## PARAMETERS

### -user_guid
{{ Fill user_guid Description }}

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None.
## OUTPUTS

### System.Object. With the user information.
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceApplications_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceApplications_GET)

