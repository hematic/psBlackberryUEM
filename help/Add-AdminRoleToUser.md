---
external help file: roles.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Roles.html#resource_Roles_assignAdminRole_PUT
schema: 2.0.0
---

# Add-AdminRoleToUser

## SYNOPSIS
Function to Assign (add or replace) the given user's Admin role with the specific Admin Role.

## SYNTAX

```
Add-AdminRoleToUser [-admin_role_guid] <Guid> [-user_guid] <Guid> [<CommonParameters>]
```

## DESCRIPTION
Function to Assign (add or replace) the given user's Admin role with the specific Admin Role.

## EXAMPLES

### EXAMPLE 1
```
Add-AdminRoleToUser -admin_role_guid 'c4c28a00-08be-4835-aa41-4c830f9f1079' -user_guid '9d61240a-e753-4483-93c2-75ef9e73ebfa'
```

## PARAMETERS

### -admin_role_guid
GUID of the admin role

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

### -user_guid
GUID of the user to update

```yaml
Type: Guid
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

## OUTPUTS

## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Roles.html#resource_Roles_assignAdminRole_PUT](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Roles.html#resource_Roles_assignAdminRole_PUT)

