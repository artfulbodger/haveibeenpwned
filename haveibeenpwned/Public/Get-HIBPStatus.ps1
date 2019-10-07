function Get-HIBPStatus
{
  <#
    .SYNOPSIS
      Checks if the supplied Email address is listed in Have I Been Pwned database.

    .DESCRIPTION
      Checks if the supplied Email address is listed on Have I been Pwned using the API.

    .PARAMETER emailaddress
      The Email address to check.
    .PARAMETER apikey
      API Key for  HIBP - Key can be purchased form https://haveibeenpwned.com/API/Key.

    .PARAMETER ratelimit
      Number of milliseconds to wait before querying the API.

    .EXAMPLE
      Get-grslHIBPStatus -emailaddress john.smith@example.com
      Checks if john.smith@example.com is listed on HIBP website

    .NOTES
      If the email address is found $true is returned, if the email address is not found, or errors $false is returned.
      To get more details about errors run the CmdLet with the -verbose switch.

    .LINK
      https://artfulbodger.github.io/haveibeenpwned/Get-HIBPStatus.html
      https://haveibeenpwned.com/API/Key
  #>

    [CmdletBinding()]
    [OutputType([Boolean])]
    Param
    (
      [Parameter(Mandatory)][string]$emailaddress,
      [Parameter()][string]$apikey,
      [Parameter()][ValidateScript({$_ -ge 1500})][string]$ratelimit = 1500
    )

    Begin
    {
      $headers = @{
        'hibp-api-key' = $apikey
        'user-agent' = 'PowerShell'
      }
    }
    Process
    {
      $uri = "https://haveibeenpwned.com/api/v3/breachedaccount/$([System.Web.HttpUtility]::UrlEncode($emailaddress))"
        Try {
            Start-Sleep -Milliseconds $ratelimit
            $result = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers -ErrorAction Stop
            Write-Verbose "Account $emailaddress has been found in $($result.Count) data breaches"
            Return $true
        } catch {
            switch($_.Exception.Response.StatusCode.value__){
                '400' {Write-Verbose 'Bad request - the account does not comply with an acceptable format (i.e. an empty string)'}
                '403' {Write-Verbose 'Forbidden - no user agent has been specified in the request'}
                '404' {Write-Verbose "Not found - the account $emailaddress could not be found and has therefore not been pwned"}
                '429' {Write-Verbose 'Too many requests - the rate limit has been exceeded'}
            }
            Return $false
        }
    }
    End
    {
    }
}