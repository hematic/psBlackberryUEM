---
external help file: helper_functions.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://stackoverflow.com/questions/74143120/convert-system-security-securestring-to-base64string
schema: 2.0.0
---

# Convert-SecureStringtoBase64

## SYNOPSIS
Function accepts a credential object and returns a base64 encoded string of the password.

## SYNTAX

```
Convert-SecureStringtoBase64 [-credential] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
Function accepts a credential object and returns a base64 encoded string of the password.

## EXAMPLES

### EXAMPLE 1
```
$EncodedPassword = Convert-SecureStringtoBase64 -credential $credential
```

## PARAMETERS

### -credential
Specifies the credential to convert.

```yaml
Type: PSCredential
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

### System.String. Base64encoded string representing the password.
## NOTES

## RELATED LINKS

[https://stackoverflow.com/questions/74143120/convert-system-security-securestring-to-base64string](https://stackoverflow.com/questions/74143120/convert-system-security-securestring-to-base64string)

