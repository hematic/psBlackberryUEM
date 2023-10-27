---
external help file: users.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_sendUserDeviceApplicationCommand_POST
schema: 2.0.0
---

# Invoke-UserDeviceApplicationCommand

## SYNOPSIS
Function to send commands to act against specific application on the users phone.

## SYNTAX

### Default (Default)
```
Invoke-UserDeviceApplicationCommand -user_guid <Guid> -device_guid <Guid> -application_guid <Guid>
 -command <String> [<CommonParameters>]
```

### UNBLOCK_APPLICATION
```
Invoke-UserDeviceApplicationCommand -user_guid <Guid> -device_guid <Guid> -application_guid <Guid>
 -command <String> -actionId <String> [<CommonParameters>]
```

### BLOCK_APPLICATION
```
Invoke-UserDeviceApplicationCommand -user_guid <Guid> -device_guid <Guid> -application_guid <Guid>
 -command <String> -title <String> -body <String> -actionId <String> [<CommonParameters>]
```

### ATTEST_APPLICATION
```
Invoke-UserDeviceApplicationCommand -user_guid <Guid> -device_guid <Guid> -application_guid <Guid>
 -command <String> -type <String> [<CommonParameters>]
```

## DESCRIPTION
This function has a set array of 5 commands it can pass to the phone.
Please check out this endpoint
/{tenantGuid}/api/v1/users/{userGuid}/userDevices/{userDeviceGuid}/applications/{appGuid}/commands
for specifics on the available commands.
Or look at the code below.

## EXAMPLES

### EXAMPLE 1
```
#This deletes all app data for an application.
Invoke-UEMUserDeviceApplicationCommand -user_guid $uguid -device_guid $dguid -application_guid $aguid -command 'DELETE_APPLICATION'
```

### EXAMPLE 2
```
#This would block the passed application and display a message on the phone.
Invoke-UEMUserDeviceApplicationCommand -user_guid $uguid -device_guid $dguid -application_guid $aguid -command 'BLOCK_APPLICATION' `
                                       -title $title -body 'You have had an application blocked' -actionid 'wc_blackberry_work_block'
```

### EXAMPLE 3
```
#This actually have no idea what attestation means.
Invoke-UEMUserDeviceApplicationCommand -user_guid $uguid -device_guid $dguid -application_guid $aguid -command 'ATTEST_APPLICATION' -type "HARDWARE_KEY"
```

## PARAMETERS

### -user_guid
\[System.Guid\] This is the guid of the user who owns the device we will be acting against.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -application_guid
\[System.Guid\] This is the guid of the application installed on the device we will be acting against.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -command
\[string\] This is command we will be sending to act against the application.
The only valid commands
at time of writing are: "LOCK_APPLICATION", "DELETE_APPLICATION","ATTEST_APPLICATION","BLOCK_APPLICATION","UNBLOCK_APPLICATION"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -type
\[string\] This is only passed if the "ATTEST_APPLICATION" command has been passed.
Its possible values are: 
"SAFETYNET", "HARDWARE_KEY", "APP_INTEGRITY"

```yaml
Type: String
Parameter Sets: ATTEST_APPLICATION
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -title
\[string\] This is only passed if the 'BLOCK_APPLICATION' command has been passed.

```yaml
Type: String
Parameter Sets: BLOCK_APPLICATION
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -body
\[string\] This is only passed if the 'BLOCK_APPLICATION' command has been passed.

```yaml
Type: String
Parameter Sets: BLOCK_APPLICATION
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -actionId
\[string\] This is only passed if the 'BLOCK_APPLICATION' or 'UNBLOCK_APPLICATION' commands have been passed.

```yaml
Type: String
Parameter Sets: UNBLOCK_APPLICATION, BLOCK_APPLICATION
Aliases:

Required: True
Position: Named
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

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_sendUserDeviceApplicationCommand_POST](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_sendUserDeviceApplicationCommand_POST)

