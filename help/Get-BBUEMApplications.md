---
external help file: applications.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Applications.html#resource_Applications_getApplications_GET
schema: 2.0.0
---

# Get-BBUEMApplications

## SYNOPSIS
Function to search the blackberry uem api and get available applications.

## SYNTAX

```
Get-BBUEMApplications [-application] <String> [<CommonParameters>]
```

## DESCRIPTION
This function searches the Blackberry UEM API by uapplication name and returns an array of matching applications.

## EXAMPLES

### EXAMPLE 1
```
Get-UEMAPIUApplications -application 'UEM Client'
```

### EXAMPLE 2
```
Get-UEMAPIUApplications -application 'UEM*'
```

## PARAMETERS

### -application
This must be the application in blackberry uem.
This also accepts wildcarding like 'Blackb*' which would return potentially multiple Blackberry apps.

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

### System.Array. Returns an array of applications matching the user guid query.
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Applications.html#resource_Applications_getApplications_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Applications.html#resource_Applications_getApplications_GET)

