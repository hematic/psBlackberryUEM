---
external help file: application_groups.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_update_PUT
schema: 2.0.0
---

# Set-BBUEMApplicationGroup

## SYNOPSIS
Function to Update an existing application group.
Name or description should be provided.

## SYNTAX

```
Set-BBUEMApplicationGroup [-app_group_guid] <Guid> [-name] <String> [[-description] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
This function Updates an existing application group.
Name or description should be provided.

## EXAMPLES

### EXAMPLE 1
```
Set-BBUEMApplicationGroup -app_group_id $guid -name 'New App group Name'
```

### EXAMPLE 2
```
Set-BBUEMApplicationGroup -app_group_id $guid -description 'New App group Description'
```

## PARAMETERS

### -app_group_guid
The application group identifier.

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

### -name
The application group name to update.

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

### -description
The application group name to update.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
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

### unknown
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_update_PUT](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_update_PUT)

