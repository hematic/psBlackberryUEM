---
external help file: users.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceProfiles_GET
schema: 2.0.0
---

# Get-UserDeviceProfiles

## SYNOPSIS
Function to retrieve effective device profiles for a device.

## SYNTAX

```
Get-UserDeviceProfiles [-user_guid] <Guid> [-device_guid] <Guid> [<CommonParameters>]
```

## DESCRIPTION
Get effective profiles for a user device.
The effective profiles are the profiles 
that will actually get delivered to the user device.
A profile that is assigned to 
a user directly, via a user group, or via a device group may not actually get delivered 
to the user device, for example due to OS and version compatibility.

## EXAMPLES

### EXAMPLE 1
```
Get-UEMUserDeviceProfile -user_guid $uguid -device_guid $dguid
```

## PARAMETERS

### -user_guid
\[System.Guid\] This is the guid of the user who owns the device we will be acting against.

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

### -device_guid
\[System.Guid\] This is the guid of the device we will be acting against.

```yaml
Type: Guid
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

### No idea yet, havent been able to test it.
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceProfiles_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceProfiles_GET)

