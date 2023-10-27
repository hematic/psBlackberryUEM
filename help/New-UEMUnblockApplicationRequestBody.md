---
external help file: request_body_functions.psm1-help.xml
Module Name: psBlackberryUEM
online version: https://developer.blackberry.com/files/bws/reference/blackberry_uem_12_18_rest/resource_Application_Groups.html#resource_Application_Groups_create_POST
schema: 2.0.0
---

# New-UEMUnblockApplicationRequestBody

## SYNOPSIS
Function generates a request body for specific API Endpoint.

## SYNTAX

```
New-UEMUnblockApplicationRequestBody [-actionId] <String> [<CommonParameters>]
```

## DESCRIPTION
Function generates a request body for specific API Endpoint.

## EXAMPLES

### EXAMPLE 1
```
New-UEMUnblockApplicationRequestBody -actionid $actionid
```

## PARAMETERS

### -actionId
This must be the same value that was used in the preceding and related BLOCK_APPLICATION action(s). 
No format or value restrictions apply.
If more than one actionIds were sent in more than one BLOCK_APPLICATION calls, 
all actionIDs used must be sent in separate calls to unblock the application (order of calls is not important for this).

```yaml
Type: String
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

### None.
## OUTPUTS

### JSON. Returns an json formatted request body.
## NOTES

## RELATED LINKS
