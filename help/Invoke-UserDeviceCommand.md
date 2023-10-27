---
external help file: users.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_sendUserDeviceCommand_POST
schema: 2.0.0
---

# Invoke-UserDeviceCommand

## SYNOPSIS
Function to send commands to act against an entire device.

## SYNTAX

```
Invoke-UserDeviceCommand [-user_guid] <Guid> [-device_guid] <Guid> [-command] <String> [<CommonParameters>]
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
Invoke-UEMUserDeviceApplicationCommand -user_guid $uguid -device_guid $dguid -application_guid $aguid -command 'DELETE_APPLICATION'
```

### EXAMPLE 2
```
#This would delete only work data on the device.
Invoke-UEMUserDeviceApplicationCommand -user_guid $uguid -device_guid $dguid -command 'DELETE_WORK_SPACE_DATA'
```

### EXAMPLE 3
```
#This would remove a device from UEM without waiting for a response from the device.
Invoke-UEMUserDeviceApplicationCommand -user_guid $uguid -device_guid $dguid -command 'REMOVE_DEVICE'
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

### -command
\[string\] This is command we will be sending to act against the application.
The only valid commands
we support right now are: "DELETE_WORK_SPACE_DATA","REMOVE_DEVICE"

```yaml
Type: String
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

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_sendUserDeviceCommand_POST](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_sendUserDeviceCommand_POST)

