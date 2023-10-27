---
external help file: application_groups.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_getAppGroup_GET
schema: 2.0.0
---

# Get-BBUEMApplicationGroup

## SYNOPSIS
Function to retrieve an application group.

## SYNTAX

```
Get-BBUEMApplicationGroup [-app_group_guid] <Guid> [<CommonParameters>]
```

## DESCRIPTION
This function retrieves an application group.

## EXAMPLES

### EXAMPLE 1
```
Get-BBUEMApplicationGroup -app_group_guid $guid
```

## PARAMETERS

### -app_group_guid
The guid of the application group to retrieve.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None.
## OUTPUTS

### unknown
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_getAppGroup_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_getAppGroup_GET)

