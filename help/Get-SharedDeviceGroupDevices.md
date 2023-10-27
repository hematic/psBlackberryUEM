---
external help file: shared_device_groups.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Shared_Device_Groups.html#resource_Shared_Device_Groups_getSharedDeviceGroupDevices_GET
schema: 2.0.0
---

# Get-SharedDeviceGroupDevices

## SYNOPSIS
Function to search the blackberry uem api and Get all user devices from a shared device group by GUID.

## SYNTAX

```
Get-SharedDeviceGroupDevices [-guid] <Guid> [<CommonParameters>]
```

## DESCRIPTION
This function searches the Blackberry UEM API by username and 
gets all user devices from a shared device group by GUID.

## EXAMPLES

### EXAMPLE 1
```
Get-SharedDeviceGroupDevices -guid '24caf4ad-41a7-453b-89b3-ef1d313cac1a'
```

## PARAMETERS

### -guid
Guid of the shared device group to get the UserDevices from

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

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Shared_Device_Groups.html#resource_Shared_Device_Groups_getSharedDeviceGroupDevices_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Shared_Device_Groups.html#resource_Shared_Device_Groups_getSharedDeviceGroupDevices_GET)

