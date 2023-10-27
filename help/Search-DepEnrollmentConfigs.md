---
external help file: apple_dep.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_getDepEnrollmentConfigs_GET
schema: 2.0.0
---

# Search-DepEnrollmentConfigs

## SYNOPSIS
Function to Get list of all DEP enrollment configurations.

## SYNTAX

```
Search-DepEnrollmentConfigs [[-dep_account_name] <String>] [[-config_name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Function to Get list of all DEP enrollment configurations.

## EXAMPLES

### EXAMPLE 1
```
Search-DepEnrollmentConfigs -dep_account_name 'sales'
```

### EXAMPLE 2
```
Search-DepEnrollmentConfigs -config_name 'C7JRXTGCGRY6' -dep_account_name 'sales'
```

## PARAMETERS

### -dep_account_name
DEP account name of the DEP enrollment config.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -config_name
{{ Fill config_name Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_getDepEnrollmentConfigs_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_getDepEnrollmentConfigs_GET)

