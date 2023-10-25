---
external help file: helper_functions.psm1-help.xml
Module Name: WC-BlackberryUEM
online version: https://stackoverflow.com/questions/36456104/invoke-restmethod-ignore-self-signed-certs
schema: 2.0.0
---

# Invoke-IgnoreCertForPS5

## SYNOPSIS
Function to bypass self-signed/internally signed certs.

## SYNTAX

```
Invoke-IgnoreCertForPS5
```

## DESCRIPTION
On PS 6.0 and up you can just use -SkipCertificateCheck.
Unfortunately PS 5.1
doesn't have this flag.
So i fell back to this model.

## EXAMPLES

### EXAMPLE 1
```
Invoke-IgnoreCertForPS5
```

## PARAMETERS

## INPUTS

### None.
## OUTPUTS

### None.
## NOTES

## RELATED LINKS

[https://stackoverflow.com/questions/36456104/invoke-restmethod-ignore-self-signed-certs](https://stackoverflow.com/questions/36456104/invoke-restmethod-ignore-self-signed-certs)

