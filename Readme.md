# Kenmori PSModule

## Installation Step
Copy the KenmoriPSModule folder to the following local folder path.


C:\Program Files\WindowsPowerShell\Modules

## Commands
These are the commands that are installed by this PS Module.

### Encode-Url
This is a command to encode url.

### Decode-Url
This is a command to decode url.

### Encode-Html
This is a command to escape HTML.

### Decode-Html
This is a command to unescape HTML.

### Parse-QueryString
This is a command to parse QueryString of the HTML.

### Decode-SafeLinks
This is a command to decode SafeLinks generated in Outlook Client.

### Decode-JsonString
This is a command to decode Json String.

### Convert-HashToPSObject
This is a command to convert the hash to PSObject.

### Convert-HashesToPSObjects
This is a command to convert the array of hash to array of PSObject, so that we can use PowerShell query or Out-GridView for further analysis.

 Example)
  $hasharray | Convert-HashesToPSObjects | Out-GridView
