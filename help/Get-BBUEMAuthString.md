---
external help file: utilities.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Applications.html#resource_Applications_getApplications_GET
schema: 2.0.0
---

# Get-BBUEMAuthString

## SYNOPSIS
This function generates a API Auth token for Blackberry UEM.

## SYNTAX

```
Get-BBUEMAuthString [-Credential] <PSCredential> [-Environment] <String> [<CommonParameters>]
```

## DESCRIPTION
The API Auth token gets set as a global variable: $global:env:uem_auth_token
The fucntion also sets a base api url string for connectingto dev and prod.
That global variable is: $global:env:uem_environment.
This allows for cleaner
uri strings in the other functions without needing to support dev and prod each time.

## EXAMPLES

### EXAMPLE 1
```
Get-UEMApiAuthString -Credential $Credential -Environment dev
```

### EXAMPLE 2
```
Get-UEMApiAuthString -Credential (get-credential) -Environment prod
```

## PARAMETERS

### -Credential
Specifies the credential for connecting to the API.

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

### -Environment
The user simply needs to know if they want to connect to dev or prod and the code
will handle the appropriate url generation.

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

### None.
## NOTES

## RELATED LINKS
