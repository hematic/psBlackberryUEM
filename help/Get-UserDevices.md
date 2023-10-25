---
external help file: users.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUserDevices_GET
schema: 2.0.0
---

# Get-UserDevices

## SYNOPSIS
Function to search the blackberry uem api and get devices belonging to a specific user.

## SYNTAX

```
Get-UserDevices [-user_guid] <String> [<CommonParameters>]
```

## DESCRIPTION
This function searches the Blackberry UEM API by userguid and returns one or more user devices.
If the user does not exist it returns an empty array.

## EXAMPLES

### EXAMPLE 1
```
Get-UEMAPIUserDevices -user_guid $user.guid
```

### EXAMPLE 2
```
Get-UEMAPIUserDevices -user_guid 'cf60110b-d540-4b6c-b316-d83aa201344f'
```

## PARAMETERS

### -user_guid
{{ Fill user_guid Description }}

```yaml
Type: String
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

### System.Array. Returns an array of devices matching the user guid query.
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUserDevices_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUserDevices_GET)

