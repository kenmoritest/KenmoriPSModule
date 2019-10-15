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

### Encode-Base64String
This is a command to convert from string to Base64String

Example)
 Encode-Base64String "string"

 Encode-Base64String "string" -Encode utf-8

### Decode-Base64String
This is a command to convert from Base64String to string.

Example)
 Decode-Base64String "string"

 Decode-Base64String "string" -Encode utf-8
 
### Encode-Base64Binary
This is a command to convert from binary to Base64String text file.

Example)
 Encode-Base64Binary -InputFile "my.png" -OutFile "my.txt"

### Decode-Base64String
This is a command to convert from Base64String text file to the original file.

Example)
 Decode-Base64Binary -InputFile "my.txt" -OutFile "my.png"

