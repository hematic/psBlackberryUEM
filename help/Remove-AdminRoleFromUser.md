---
external help file: roles.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Roles.html#resource_Roles_removeAdminRole_DELETE
schema: 2.0.0
---

# Remove-AdminRoleFromUser

## SYNOPSIS
Function to Remove the specific admin role from the specific user.

## SYNTAX

```
Remove-AdminRoleFromUser [-admin_role_guid] <Guid> [-user_guid] <Guid> [<CommonParameters>]
```

## DESCRIPTION
Function to Remove the specific admin role from the specific user.

## EXAMPLES

### EXAMPLE 1
```
Remove-AdminRoleFromUser -admin_role_guid 'a8fafde0-c6b9-4e56-8109-2b9bc0d3c6b1' -user_guid 'f337f066-e53e-44cf-be43-c25738e3fcc8'
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

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Roles.html#resource_Roles_removeAdminRole_DELETE](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Roles.html#resource_Roles_removeAdminRole_DELETE)

