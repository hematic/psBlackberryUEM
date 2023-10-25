---
external help file: users.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUsers_GET
schema: 2.0.0
---

# Search-User

## SYNOPSIS
Function to search the blackberry uem api by username with pagination.

## SYNTAX

```
Search-User [-user] <String> [[-offset] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This function searches the Blackberry UEM API by username and returns one or more user objects with pagination.
If the user does not exist it returns an empty array.

## EXAMPLES

### EXAMPLE 1
```
Search-UEMAPiUser -user 'stephaniem' -offset 5
```

### EXAMPLE 2
```
Search-UEMAPiUser -user 'stephan*' -offset 10
```

## PARAMETERS

### -user
The username to search for.

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

### -offset
The starting point from where to fetch the next set of results.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUsers_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUsers_GET)

