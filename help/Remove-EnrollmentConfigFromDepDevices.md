---
external help file: apple_dep.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_unassignEnrollmentConfigurationFromDEPDevices_DELETE
schema: 2.0.0
---

# Remove-EnrollmentConfigFromDepDevices

## SYNOPSIS
Unassign DEP enrollment configuration from one or more DEP devices by GUID. 
Only the GUID field of each DEP device is required.
If a device listed in the 
request body doesn't have enrollment configuration assigned or has another enrollment 
configuration assigned, it will be ignored.
If enrollment configuration was not 
unassigned from one or more devices listed in the request, these devices will be returned 
in the response.

## SYNTAX

```
Remove-EnrollmentConfigFromDepDevices [-dep_enrollment_config_guid] <Guid> [-dep_device_guids] <Guid[]>
 [<CommonParameters>]
```

## DESCRIPTION
Unassign DEP enrollment configuration from one or more DEP devices by GUID. 
Only the GUID field of each DEP device is required.
If a device listed in the 
request body doesn't have enrollment configuration assigned or has another enrollment 
configuration assigned, it will be ignored.
If enrollment configuration was not 
unassigned from one or more devices listed in the request, these devices will be returned 
in the response.

## EXAMPLES

### EXAMPLE 1
```
Remove-EnrollmentConfigFromDepDevices -$dep_enrollment_config_guid '51591f77-cd3a-4dea-9bd6-8addd47b6fe2' -dep_device_guids $device_guids
```

## PARAMETERS

### -dep_enrollment_config_guid
GUID of enrollment configuration.

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

### -dep_device_guids
Guids of DEP devices

```yaml
Type: Guid[]
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

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_unassignEnrollmentConfigurationFromDEPDevices_DELETE](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Apple_DEP.html#resource_Apple_DEP_unassignEnrollmentConfigurationFromDEPDevices_DELETE)

