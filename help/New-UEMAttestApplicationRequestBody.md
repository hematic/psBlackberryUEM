---
external help file: request_body_functions.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_sendUserDeviceCommand_POST
schema: 2.0.0
---

# New-UEMAttestApplicationRequestBody

## SYNOPSIS
Function generates a request body for specific API Endpoint.

## SYNTAX

```
New-UEMAttestApplicationRequestBody [-type] <String> [<CommonParameters>]
```

## DESCRIPTION
Function generates a request body for specific API Endpoint.

## EXAMPLES

### EXAMPLE 1
```
New-UEMAttestApplicationRequestBody -type SAFETYNET
```

## PARAMETERS

### -type
Possible values: SAFETYNET, HARDWARE_KEY or APP_INTEGRITY

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

### JSON. Returns an json formatted request body.
## NOTES

## RELATED LINKS
