---
external help file: company_directories.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Company_directories.html#resource_Company_directories_getUsers_GET
schema: 2.0.0
---

# Search-CompanyDirectories

## SYNOPSIS
Function to search the blackberry uem api by username with pagination.

## SYNTAX

```
Search-CompanyDirectories [-query_value] <String> [[-limit] <Int32>] [[-include_existing_users] <Boolean>]
 [<CommonParameters>]
```

## DESCRIPTION
Search for users in all configured company directories.
This will most 
often be used in order to create a directory-linked user (see the "Users" 
resource for creating a directory-linked user).

## EXAMPLES

### EXAMPLE 1
```
Search-CompanyDirectories -query_value 'marshall' -limit 50 -include_existing_users $true
```

## PARAMETERS

### -query_value
A required non-empty value to search for directory users, using a 
case-insensitive prefix match.
For AD company directories, an Ambiguous 
Name Resolution (ANR) search is performed.
For LDAP company directories, 
the search is performed across various configured fields, for example 
displayName, emailAddress, firstName, lastName, username.

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

### -limit
The maximum number of matching directory users to get. 
If specified, the value must be between 1 and 100, inclusive. 
Defaults to 100 if not provided.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 100
Accept pipeline input: False
Accept wildcard characters: False
```

### -include_existing_users
The maximum number of matching directory users to get. 
If specified, the value must be between 1 and 100, inclusive. 
Defaults to 100 if not provided.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### psCustomObject
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Company_directories.html#resource_Company_directories_getUsers_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Company_directories.html#resource_Company_directories_getUsers_GET)

