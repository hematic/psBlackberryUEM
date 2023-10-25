---
external help file: users.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getServices_GET
schema: 2.0.0
---

# Get-UserServices

## SYNOPSIS
Function to retrieve services assigned to a user.

## SYNTAX

```
Get-UserServices [-user_guid] <Guid> [<CommonParameters>]
```

## DESCRIPTION
Function to retrieve services assigned to a user.

## EXAMPLES

### EXAMPLE 1
```
Get-BBUEMUserServices -user_guid 'db7c8555-17c2-46b4-be55-86d567f4f7cc'
```

## PARAMETERS

### -user_guid
This must be the guid of the user in blackberry uem.

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

### #TODO
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getServices_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getServices_GET)

