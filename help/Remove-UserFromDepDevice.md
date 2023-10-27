---
external help file: apple_dep.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_unassignUserFromDEPDevice_DELETE
schema: 2.0.0
---

# Remove-UserFromDepDevice

## SYNOPSIS
Function to Unassign a user, by GUID, from a DEP device.

## SYNTAX

```
Remove-UserFromDepDevice [-dep_device_guid] <Guid> [<CommonParameters>]
```

## DESCRIPTION
Function to Unassign a user, by GUID, from a DEP device.

## EXAMPLES

### EXAMPLE 1
```
Remove-UserFromDepDevice -dep_device_guid 'eb4f5da2-e221-4403-a78f-3513902e2718'
```

## PARAMETERS

### -dep_device_guid
The DEP device guid to search for.

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

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_unassignUserFromDEPDevice_DELETE](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_unassignUserFromDEPDevice_DELETE)

