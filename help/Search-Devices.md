---
external help file: devices.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Users.html#resource_Users_getUserDetail_GET
schema: 2.0.0
---

# Search-Devices

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

```
Search-Devices [[-activation_date] <DateTime>] [[-operator] <String>] [[-dynamics_container_id] <String>]
 [[-guid] <Guid>] [[-imei] <String>] [[-meid] <String>] [[-ownership] <String>] [[-udid] <String>]
 [[-wifi_mac_address] <String>] [[-shared_device_only] <Boolean>] [[-os] <String>] [[-os_family_name] <String>]
 [[-hardware_model] <String>] [[-hardware_vendor_company_name] <String>] [[-enrollment_type] <String>]
 [[-include_total] <Boolean>] [[-max] <Int32>] [[-offset] <Int32>] [<CommonParameters>]
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

### -activation_date
{{ Fill activation_date Description }}

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -dynamics_container_id
{{ Fill dynamics_container_id Description }}

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

### -enrollment_type
{{ Fill enrollment_type Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: EXTERNAL_SERVICE, FULL_CONTROL_KNOX, MDM_CONTROLS, STRONG_AUTHENTICATION_BY_BLACKBERRY, USER_PRIVACY, USER_PRIVACY_AFW, USER_PRIVACY_AFW_PREMIUM, USER_PRIVACY_DYNAMICS, USER_PRIVACY_KNOX, USER_PRIVACY_USER_ENROLLMENT, USER_PRIVACY_WITH_PROFILES, WORK_AND_PERSONAL_CORPORATE, WORK_AND_PERSONAL_REGULATED, WORK_SPACE_ONLY, WORK_SPACE_ONLY_AFW, WORK_SPACE_ONLY_AFW_PREMIUM, WORK_SPACE_ONLY_KNOX

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -guid
{{ Fill guid Description }}

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -hardware_model
{{ Fill hardware_model Description }}

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

### -hardware_vendor_company_name
{{ Fill hardware_vendor_company_name Description }}

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

### -imei
{{ Fill imei Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -include_total
{{ Fill include_total Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -max
{{ Fill max Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -meid
{{ Fill meid Description }}

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

### -offset
{{ Fill offset Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -operator
{{ Fill operator Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Less Than, Less Than Or Equal To, Greater Than, Greater Than Or Equal To

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -os
{{ Fill os Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -os_family_name
{{ Fill os_family_name Description }}

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

### -ownership
{{ Fill ownership Description }}

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

### -shared_device_only
{{ Fill shared_device_only Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -udid
{{ Fill udid Description }}

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

### -wifi_mac_address
{{ Fill wifi_mac_address Description }}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
