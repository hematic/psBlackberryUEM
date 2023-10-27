---
external help file: apple_dep.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_getDepDevices_GET
schema: 2.0.0
---

# Search-DepDevices

## SYNOPSIS
Function to get a list of all DEP devices.

## SYNTAX

### ByName
```
Search-DepDevices -dep_account_name <String> [-offset <Int32>] [-max <Int32>] [<CommonParameters>]
```

### BySerial
```
Search-DepDevices -serial_number <String> [-offset <Int32>] [-max <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This function searches the Blackberry UEM API by depAccountName or serialNumber and 
returns one or more dep device with pagination information.

## EXAMPLES

### EXAMPLE 1
```
Search-DepDevices -dep_account_name 'sales'
```

### EXAMPLE 2
```
Search-DepDevices -serial_number 'C7JRXTGCGRY6' -max 70
```

## PARAMETERS

### -dep_account_name
The DEP account name to search for.

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

### -serial_number
Serial number of the DEP device.

```yaml
Type: String
Parameter Sets: BySerial
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -offset
The number of matching accounts to exclude from the beginning of the list of accounts 
in the response; greater than or equal to 0.
If not specified, a value of 0 will be used 
to indicate that no matches should be excluded.
Used in order to get "pages" of results. 
For example, to get the first 50 matching accounts, specify max=50 (and optionally offset=0); 
and to get the next 50 matching accounts specify max=50 and offset=50, and so on.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -max
The maximum number of account results to get, between 1 and 1000 inclusive. 
If not specified, a value of 100 will be used.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 100
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_getDepDevices_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_getDepDevices_GET)

