---
external help file: users.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUserDevices_GET
schema: 2.0.0
---

# Get-UserDeviceByGuid

## SYNOPSIS
Function to search the blackberry uem api and get a specific user device by guid.

## SYNTAX

```
Get-UserDeviceByGuid [-user_guid] <String> [-device_guid] <String> [<CommonParameters>]
```

## DESCRIPTION
Function to search the blackberry uem api and get a specific user device by guid.

## EXAMPLES

### EXAMPLE 1
```
Get-BBUEMUserDeviceByGuid -user_guid $user.guid -device_guid $device_guid
```

### EXAMPLE 2
```
Get-UEMAPIUserDevices -user_guid 'cf60110b-d540-4b6c-b316-d83aa201344f'
```

## PARAMETERS

### -user_guid
This must be the guid of the user in blackberry uem.

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

### -device_guid
{{ Fill device_guid Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None.
## OUTPUTS

### System.Object. Returns a device object matching the user guid query.
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUserDevices_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUserDevices_GET)

