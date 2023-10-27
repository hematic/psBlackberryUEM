---
external help file: apple_dep.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_assignUserToDEPDevice_PUT
schema: 2.0.0
---

# Set-DepDeviceUser

## SYNOPSIS
Function to Assign (add or replace) the given user to a DEP device.

## SYNTAX

```
Set-DepDeviceUser [-dep_device_guid] <Guid> [-user_guid] <Guid> [<CommonParameters>]
```

## DESCRIPTION
Function to Assign (add or replace) the given user to a DEP device.

## EXAMPLES

### EXAMPLE 1
```
Set-DepDeviceUser -dep_device_guid 'eb4f5da2-e221-4403-a78f-3513902e2718' -user_guid '49562438-7f3c-4853-8347-3c18b03cbd8c'
```

## PARAMETERS

### -dep_device_guid
GUID of DEP device

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

### -user_guid
GUID of user

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

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_assignUserToDEPDevice_PUT](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_assignUserToDEPDevice_PUT)

