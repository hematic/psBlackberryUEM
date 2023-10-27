---
external help file: application_groups.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_getAppGroups_GET
schema: 2.0.0
---

# Search-BBUEMApplicationGroups

## SYNOPSIS
Function to Get all application groups or application groups with a specific query. 
If no application groups are found, an empty application group list is included in the response body.

## SYNTAX

```
Search-BBUEMApplicationGroups [-name] <String> [<CommonParameters>]
```

## DESCRIPTION
This function Get all application groups or application groups with a specific query. 
If no application groups are found, an empty application group list is included in the response body.

## EXAMPLES

### EXAMPLE 1
```
Search-BBUEMApplicationGroups -name 'TestAppGroup'
```

## PARAMETERS

### -name
Name of the application group.
Case insensitive exact match.

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

### unknown
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_getAppGroups_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_getAppGroups_GET)

