---
external help file: apple_dep.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDetail_GET
schema: 2.0.0
---

# Search-DepAccounts

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### ByName
```
Search-DepAccounts -name <String> [-offset <Int32>] [-max <Int32>] [<CommonParameters>]
```

### ByToken
```
Search-DepAccounts -token_expiry_date <DateTime> [-offset <Int32>] [-max <Int32>] [<CommonParameters>]
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

### -max
{{ Fill max Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -name
{{ Fill name Description }}

```yaml
Type: String
Parameter Sets: ByName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -offset
{{ Fill offset Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -token_expiry_date
{{ Fill token_expiry_date Description }}

```yaml
Type: DateTime
Parameter Sets: ByToken
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

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
