---
external help file: haveibeenpwned-help.xml
Module Name: haveibeenpwned
online version: https://artfulbodger.github.io/haveibeenpwned/Get-HIBPStatus
schema: 2.0.0
---

# Get-HIBPStatus

## SYNOPSIS
Checks if the supplied Email address is listed in Have I Been Pwned database.

## SYNTAX

```
Get-HIBPStatus [-emailaddress] <String> [[-apikey] <String>] [[-ratelimit] <String>] [<CommonParameters>]
```

## DESCRIPTION
Checks if the supplied Email address is listed on Have I been Pwned using the API.

## EXAMPLES

### EXAMPLE 1
```
Get-grslHIBPStatus -emailaddress john.smith@example.com
```

Checks if john.smith@example.com is listed on HIBP website

## PARAMETERS

### -emailaddress
The Email address to check.

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

### -apikey
API Key for  HIBP - Key can be purchased form https://haveibeenpwned.com/API/Key.

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

### -ratelimit
Number of milliseconds to wait before querying the API.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 1500
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Boolean
## NOTES
If the email address is found $true is returned, if the email address is not found, or errors $false is returned.
To get more details about errors run the CmdLet with the -verbose switch.

## RELATED LINKS

[https://artfulbodger.github.io/haveibeenpwned/Get-HIBPStatus](https://artfulbodger.github.io/haveibeenpwned/Get-HIBPStatus)