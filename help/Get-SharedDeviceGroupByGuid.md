---
external help file: shared_device_groups.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Shared_Device_Groups.html#resource_Shared_Device_Groups_getSharedDeviceGroup_GET
schema: 2.0.0
---

# Get-SharedDeviceGroupByGuid

## SYNOPSIS
Function to search the blackberry uem api and get 
one shared device group by GUID.

## SYNTAX

```
Get-SharedDeviceGroupByGuid [-guid] <Guid> [<CommonParameters>]
```

## DESCRIPTION
Get one shared device group by GUID.

## EXAMPLES

### EXAMPLE 1
```
Get-SharedDeviceGroupByGuid -guid 'b15da5f1-a6e7-4bed-ae51-c3d4b99dc397'
```

## PARAMETERS

### -guid
GUID of the shared device group to get

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

## OUTPUTS

## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Shared_Device_Groups.html#resource_Shared_Device_Groups_getSharedDeviceGroup_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Shared_Device_Groups.html#resource_Shared_Device_Groups_getSharedDeviceGroup_GET)

