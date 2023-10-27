---
external help file: application_groups.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_create_POST
schema: 2.0.0
---

# New-BBUEMApplicationGroup

## SYNOPSIS
Function to Create an application group.
Only the name field of the group is required.
The description field is optional.

## SYNTAX

```
New-BBUEMApplicationGroup [-name] <String> [[-description] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function Creates an application group.
Only the name field of the group is required.
The description field is optional.

## EXAMPLES

### EXAMPLE 1
```
New-BBUEMApplicationGroup -name $app_group_name -description $description
```

## PARAMETERS

### -name
The application group name.

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

### -description
The application group description.

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

### None.
## OUTPUTS

### unknown
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_create_POST](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_create_POST)

