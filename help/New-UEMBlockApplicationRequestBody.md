---
external help file: request_body_functions.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_sendUserDeviceCommand_POST
schema: 2.0.0
---

# New-UEMBlockApplicationRequestBody

## SYNOPSIS
Function generates a request body for specific API Endpoint.

## SYNTAX

```
New-UEMBlockApplicationRequestBody [-actionId] <String> [-title] <String> [-body] <String> [<CommonParameters>]
```

## DESCRIPTION
Function generates a request body for specific API Endpoint.

## EXAMPLES

### EXAMPLE 1
```
New-UEMBlockApplicationRequestBody -actionid $actionid -title $title -body $body
```

## PARAMETERS

### -actionId
A unique identifier for any Block action.
Can be any value as long as it is unique. 
When sending a corresponding UNBLOCK_APPLICATION command later on, the same value must be used to correlate the commands.

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

### -title
Title of the message that indicates that the device is in a blocked state (optional).

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

### -body
Detailed message that displays on the same screen as the title. 
For example, the message can provide steps to follow to get the device back in compliance (optional).

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

### JSON. Returns an json formatted request body.
## NOTES

## RELATED LINKS
