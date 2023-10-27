---
external help file: servers.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Servers.html#resource_Servers_getServer_GET
schema: 2.0.0
---

# Get-BBUEMServerByGuid

## SYNOPSIS
Get the server (ex.
BlackBerry Unified Endpoint Manager, 
BlackBerry Connectivity Node) in the UEM topology.

## SYNTAX

```
Get-BBUEMServerByGuid [-server_guid] <Guid> [<CommonParameters>]
```

## DESCRIPTION
Get the server (ex.
BlackBerry Unified Endpoint Manager, 
BlackBerry Connectivity Node) in the UEM topology.

## EXAMPLES

### EXAMPLE 1
```
Get-BBUEMServerByGuid -guid 'b88bb3f5-5056-43d5-851d-b9a55d0984c5'
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Servers.html#resource_Servers_getServer_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Servers.html#resource_Servers_getServer_GET)

