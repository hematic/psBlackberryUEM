---
external help file: application_groups.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_addApplications_POST
schema: 2.0.0
---

# Add-ApplicationGroupApps

## SYNOPSIS
Function to Add applications to an application group.

The application GUID is used to identify the applications that will be added to the application group.
All other fields will be ignored if they are provided.

## SYNTAX

```
Add-ApplicationGroupApps [-app_group_guid] <Guid> [-application_guids] <Guid[]> [<CommonParameters>]
```

## DESCRIPTION
Function to Add applications to an application group.

The application GUID is used to identify the applications that will be added to the application group.
All other fields will be ignored if they are provided.

## EXAMPLES

### EXAMPLE 1
```
Add-ApplicationGroupApps -app_group_guid $app_group_guid -application_guids $app_guids
```

## PARAMETERS

### -app_group_guid
The application grup identifier.

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

### -application_guids
The application guids.

```yaml
Type: Guid[]
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

### unknown
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_addApplications_POST](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_addApplications_POST)

