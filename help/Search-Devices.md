---
external help file: devices.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Devices.html#resource_Devices_getDevices_GET
schema: 2.0.0
---

# Search-Devices

## SYNOPSIS
Function to Search for devices.

## SYNTAX

```
Search-Devices [[-activation_date] <DateTime>] [[-operator] <String>] [[-dynamics_container_id] <String>]
 [[-guid] <Guid>] [[-imei] <String>] [[-meid] <String>] [[-ownership] <String>] [[-udid] <String>]
 [[-wifi_mac_address] <String>] [[-shared_device_only] <Boolean>] [[-os] <String>] [[-os_family_name] <String>]
 [[-hardware_model] <String>] [[-hardware_vendor_company_name] <String>] [[-enrollment_type] <String>]
 [[-include_total] <Boolean>] [[-max] <Int32>] [[-offset] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Function to Search for devices.

## EXAMPLES

### EXAMPLE 1
```
Search-Devices -guid '714a8084-a059-4fbc-91c3-99daea0d0fb8' -activation_date $date -operator "Less Than Or Equal To" -max 25
```

### EXAMPLE 2
```
Search-UEMAPiUser -user 'stephan*' -offset 10
```

## PARAMETERS

### -activation_date
Date value in ISO-8601 format yyyy-MM-ddTHH:mm:ss.SSSZ.
Use operators \> or \>= for the minimum date, and/or \< or \<= for the maximum date.
For example: activationDate\>=1970-01-01T00:00:00.000Z,activationDate\<=1970-12-31T23:59:59.000Z.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -operator
"Less Than", "Less Than Or Equal To", "Greater Than", "Greater Than Or Equal To"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -dynamics_container_id
Identifier of a Dynamics container that is activated on a device.
When searching by a BlackBerry Dynamics container Id, response will additionally contain user-device application route link that corresponds to the Dynamics application to which the container belongs and the user who owns the device.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -guid
GUID of the device.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -imei
IMEI of the device.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -meid
MEID of the device.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ownership
'CORPORATE' or 'PERSONAL'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -udid
UDID of the device.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -wifi_mac_address
WIFI MAC address of the device.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -shared_device_only
Filter to return only devices that are part of shared device groups.
If filter is not specified then all the devices will be returned

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -os
The operating system of the device.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -os_family_name
The operating system family name of the device.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -hardware_model
The hardware model of the device.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -hardware_vendor_company_name
The hardware vendor company name of the device.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -enrollment_type
The enrollment type of the device.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -include_total
If you want the total number of devices matching the search included in the response (which may be different from the number of devices actually returned) set this to true; otherwise set to false.
By default the total will not be included in the response.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -max
The maximum number of device results to get, between 1 and 1000 inclusive.
If not specified, a value of 100 will be used.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: 100
Accept pipeline input: False
Accept wildcard characters: False
```

### -offset
The number of matching devices to exclude from the beginning of the list of devices in the response; greater than or equal to 0.
If not specified, a value of 0 will be used to indicate that no matches should be excluded.
Used in order to get "pages" of results.
For example, to get the first 50 matching devices, specify max=50 (and optionally offset=0); and to get the next 50 matching devices specify max=50 and offset=50, and so on.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Devices.html#resource_Devices_getDevices_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Devices.html#resource_Devices_getDevices_GET)

