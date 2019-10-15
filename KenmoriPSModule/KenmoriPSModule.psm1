Add-Type -Assembly System.Web
function Encode-Url
{
  param(
   [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
   $InputObject
  )

  #return [System.Web.HttpUtility]::UrlEncode($InputObject)
  return [System.Uri]::EscapeDataString($InputObject)
}

function Decode-Url
{
  param(
   [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
   $InputObject
  )
  return [System.Web.HttpUtility]::UrlDecode($InputObject)
}

function Encode-Html
{
  param(
   [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
   $InputObject
  )
  return [System.Web.HttpUtility]::HtmlEncode($InputObject)
}

function Decode-Html
{
  param(
   [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
   $InputObject
  )
  return [System.Web.HttpUtility]::HtmlDecode($InputObject)
}

function Decode-SafeLinks
{
  param(
   [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
   $InputObject
  )
  
  return (Parse-QueryString $InputObject)["url"]
}

function Decode-JsonString
{
  param(
    [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
    $InputObject
  )
  return (ConvertFrom-Json -InputObject ("{ ""Data"": """ + $InputObject + """}")).Data
}

function Parse-QueryString
{
  param(
   [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
   $InputObject
  )
  $uri = New-Object System.Uri($InputObject)
  $ht = New-Object System.Collections.Hashtable
  $data = [System.Web.HttpUtility]::ParseQueryString($uri.Query)
  foreach ($key in $data.Keys)
  {
    $ht.Add($key, $data[$key])
  }
  return $ht
}

function Convert-HashToPSObject
{
  param(
   [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
   $InputObject
  )

  return New-Object PSObject -Property $InputObject
}

function Convert-HashesToPSObjects
{
  param(
   [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
   $InputObject
  )
  process { $InputObject |% { Convert-HashToPSObject $_ } }
}

function Encode-Base64String
{
  param(
    [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
    $InputStr,
    [parameter(Mandatory=$false, Position=1)]
    $Encode
  )
  
  if ($Encode)
  {
    $enc = [System.Text.Encoding]::GetEncoding($Encode)
  }
  else
  {
    $enc = [System.Text.Encoding]::Default 
  }
  return [System.Convert]::ToBase64String($enc.GetBytes($InputStr))
}

function Decode-Base64String
{
  param(
    [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
    $InputStr,
    [parameter(Mandatory=$false, Position=1)]
    $Encode
  )
  
  if ($Encode)
  {
    $enc = [System.Text.Encoding]::GetEncoding($Encode)
  }
  else
  {
    $enc = [System.Text.Encoding]::Default 
  }
  return $enc.GetString([System.Convert]::FromBase64String($InputStr))
}

function Encode-Base64Binary
{
  param(
    [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
    $InputFile,
    [parameter(Mandatory=$true, Position=1)]
    $OutFile
  )
  ([System.Convert]::ToBase64String((Get-Content $InputFile -Encoding Byte))) | Set-Content $OutFile
}

function Decode-Base64Binary
{
  param(
    [parameter(Mandatory=$true, Position=0, ValueFromPipeLine=$true)]
    $InputFile,
    [parameter(Mandatory=$true, Position=1)]
    $OutFile
  )
  ([System.Convert]::FromBase64String((Get-Content $InputFile))) | Set-Content $OutFile -Encoding Byte
}