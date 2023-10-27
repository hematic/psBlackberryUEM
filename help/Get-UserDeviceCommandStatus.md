---
external help file: users.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceCommandStatus_GET
schema: 2.0.0
---

# Get-UserDeviceCommandStatus

## SYNOPSIS
Function to retrieve status of command that has been sent to a device.

## SYNTAX

```
Get-UserDeviceCommandStatus [-user_guid] <Guid> [-device_guid] <Guid> [-command_guid] <Guid>
 [<CommonParameters>]
```

## DESCRIPTION
This function has a set array of 18 commands it can pass to the phone.
Please check out this endpoint
/{tenantGuid}/api/v1/users/{userGuid}/userDevices/{userDeviceGuid}/commands
for specifics on the available commands.
Or look at the code below.
Currently there is not code coverage
for all 18 commands.
More can be added as needed.

## EXAMPLES

### EXAMPLE 1
```
#This deletes all app data for an application.
Get-UEMUserDeviceCommandStatus -user_guid $uguid -device_guid $dguid -command_guid $cguid
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

### -command_guid
\[System.Guid\] This is the guid of the command we will be searching for.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceCommandStatus_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDeviceCommandStatus_GET)

