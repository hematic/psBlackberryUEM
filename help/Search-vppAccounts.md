---
external help file: apple_vpp_account.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_VPP_Account.html#resource_Apple_VPP_Account_getVppAccounts_GET
schema: 2.0.0
---

# Search-vppAccounts

## SYNOPSIS
Function to Get details of Apple VPP accounts from a query.

## SYNTAX

### NameOnly (Default)
```
Search-vppAccounts [-vpp_account_name <String>] [<CommonParameters>]
```

### Both
```
Search-vppAccounts [-vpp_account_name <String>] -token_expiry_date <DateTime> -operator <String>
 [<CommonParameters>]
```

### DateOnly
```
Search-vppAccounts -token_expiry_date <DateTime> -operator <String> [<CommonParameters>]
```

## DESCRIPTION
Function to Get details of Apple VPP accounts from a query.

## EXAMPLES

### EXAMPLE 1
```
Search-vppAccounts -vpp_account_name 'VPP-token-version-3' -token_expiry_date '2027-01-01T00:00:00.000Z' -operator 'Less Than'
```

## PARAMETERS

### -vpp_account_name
The name of the Apple VPP account.

```yaml
Type: String
Parameter Sets: NameOnly, Both
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -token_expiry_date
The Apple VPP account token expiry date.

```yaml
Type: DateTime
Parameter Sets: Both, DateOnly
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -operator
"Less Than", "Less Than Or Equal To", "Greater Than", "Greater Than Or Equal To"

```yaml
Type: String
Parameter Sets: Both, DateOnly
Aliases:

Required: True
Position: Named
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

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_VPP_Account.html#resource_Apple_VPP_Account_getVppAccounts_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_VPP_Account.html#resource_Apple_VPP_Account_getVppAccounts_GET)

