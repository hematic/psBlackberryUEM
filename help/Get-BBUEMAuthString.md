---
external help file: utilities.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Utilities.html#resource_Utilities_generateAuthorizationHeader_POST
schema: 2.0.0
---

# Get-BBUEMAuthString

## SYNOPSIS
This function generates a API Auth token for Blackberry UEM.

## SYNTAX

```
Get-BBUEMAuthString [-Credential] <PSCredential> [-base_uri] <String> [<CommonParameters>]
```

## DESCRIPTION
The API Auth token gets set as a global variable: $global:env:uem_auth_token
The function also sets a base api url string for connecting to the environment.
That global variable is: $global:env:uem_environment.
This allows for cleaner
uri strings in the other functions without needing to support dev and prod each time.

## EXAMPLES

### EXAMPLE 1
```
Get-UEMApiAuthString -Credential $Credential -Environment https://server:port/tenantID/api/v1
```

### EXAMPLE 2
```
Get-UEMApiAuthString -Credential (get-credential) -Environment $prod
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

### -base_uri
Enter in the format of https://server:port/tenantID/api/v1

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

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Utilities.html#resource_Utilities_generateAuthorizationHeader_POST](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Utilities.html#resource_Utilities_generateAuthorizationHeader_POST)

