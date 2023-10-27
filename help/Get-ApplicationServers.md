---
external help file: application_servers.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Servers.html#resource_Application_Servers_getApplicationServers_GET
schema: 2.0.0
---

# Get-ApplicationServers

## SYNOPSIS
Function to Get the BlackBerry Dynamics application servers.

## SYNTAX

```
Get-ApplicationServers [[-app_id] <String>] [[-connection_profile_name] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function Gets the BlackBerry Dynamics application servers.

## EXAMPLES

### EXAMPLE 1
```
Get-ApplicationServers -app_id $id -connection_profile_name $profile_name
```

## PARAMETERS

### -app_id
The application identifier.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -connection_profile_name
The connection profile name.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None.
## OUTPUTS

### unknown
## NOTES

## RELATED LINKS

[https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Servers.html#resource_Application_Servers_getApplicationServers_GET](https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Servers.html#resource_Application_Servers_getApplicationServers_GET)

