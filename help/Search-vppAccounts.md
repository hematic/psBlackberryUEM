---
external help file: apple_vpp_account.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUsers_GET
schema: 2.0.0
---

# Search-vppAccounts

## SYNOPSIS
{{ Fill in the Synopsis }}

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
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -operator
{{ Fill operator Description }}

```yaml
Type: String
Parameter Sets: Both, DateOnly
Aliases:
Accepted values: Less Than, Less Than Or Equal To, Greater Than, Greater Than Or Equal To

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -token_expiry_date
{{ Fill token_expiry_date Description }}

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

### -vpp_account_name
{{ Fill vpp_account_name Description }}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
