---
external help file: servers.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Servers.html#resource_Servers_updateServiceByServerGuidAndServiceType_PUT
schema: 2.0.0
---

# Set-BBUEMServiceByServer

## SYNOPSIS
Get the server (ex.
BlackBerry Unified Endpoint Manager, 
BlackBerry Connectivity Node) in the UEM topology.

## SYNTAX

```
Set-BBUEMServiceByServer [-server_guid] <Guid> [-type] <String> [[-proxy_server_name] <String>]
 [[-direct_connect] <Boolean>] [[-proxy_host_name] <String>] [[-web_proxy] <Boolean>]
 [[-web_proxy_host_name] <String>] [[-web_proxy_port] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Updates an existing service.
Only direct connection settings can be updated using the route. 
All other fields are ignored.

Validation rules for direct connection settings:
    The proxy host name can be set only when direct connect is enabled
    Web proxy related settings can be set only when direct connect is enabled
    Web proxy related settings can be set only when web proxy and direct connect is enabled
    The web proxy port value should be from 0 to 65535 inclusive; any other value is not valid

## EXAMPLES

### EXAMPLE 1
```
Get-BBUEMServiceByServer -server_guid 'b88bb3f5-5056-43d5-851d-b9a55d0984c5' -type 'Proxy'
```

## PARAMETERS

### -server_guid
The server to get by guid.

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

### -type
The service to get by type.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -proxy_server_name
{{ Fill proxy_server_name Description }}

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

### -direct_connect
{{ Fill direct_connect Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -proxy_host_name
{{ Fill proxy_host_name Description }}

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

### -web_proxy
{{ Fill web_proxy Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -web_proxy_host_name
{{ Fill web_proxy_host_name Description }}

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

### -web_proxy_port
{{ Fill web_proxy_port Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
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

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Servers.html#resource_Servers_updateServiceByServerGuidAndServiceType_PUT](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Servers.html#resource_Servers_updateServiceByServerGuidAndServiceType_PUT)

