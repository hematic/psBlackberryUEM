---
external help file: shared_device_groups.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUsers_GET
schema: 2.0.0
---

# Get-SharedDeviceGroupDevice

## SYNOPSIS
Function to search get the details of a user device from a shared device group by GUID.

## SYNTAX

```
Get-SharedDeviceGroupDevice [-group_guid] <Guid> [-device_guid] <Guid> [<CommonParameters>]
```

## DESCRIPTION
This function searches the Blackberry UEM API and Gets the details of a user device 
from a shared device group by GUID.

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

### -group_guid
The username to search for.

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

### -device_guid
The starting point from where to fetch the next set of results.

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

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUsers_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_14_rest/resource_Users.html#resource_Users_getUsers_GET)

