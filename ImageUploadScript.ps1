<#
.SYNOPSIS
    Script to upload images to ImgBB.com via the API
.DESCRIPTION
    Converts images to base64 and uploads it to ImgBB.com via the API
.NOTES
    Requires Powershell 7 and an API key from ImgBB.com
.LINK
    https://api.imgbb.com/
.EXAMPLE
    .\ImageUploadScript.ps1 -Path 'C:\Temp\image.png' -Key '1234567890'
    Uploads the image to ImgBB.com and returns the URL
.EXAMPLE
    .\ImageUploadScript.ps1 -Path 'C:\Temp' -Key '1234567890' -OpenInBrowser
    Uploads the images to ImgBB.com, returns the URL and opens it in the default browser
.EXAMPLE
    .\ImageUploadScript.ps1 -Path 'C:\Temp' -Key '1234567890' -UploadFolder
    Uploads the images in the folder to ImgBB.com and returns the URL
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Path,
    [Parameter(Mandatory = $true)][string]$Key,
    [Parameter(ParameterSetName="Browser")][switch]$OpenInBrowser,
    [Parameter(ParameterSetName="Folder")][switch]$UploadFolder
)
if ($OpenInBrowser) {
    try {
        _UploadImage -Path $Path -Key $Key -OpenInBrowser
    }
    catch {
        $_.Exception.Response
    }
}
elseif ($UploadFolder) {
        try {
            Get-ChildItem -Path $Path -Recurse -File -Include *.jpg,*.png,*.bmp,*.gif | _UploadFolder -Key $Key
        }
        catch {
            $_.Exception.Response
        }
}
else {
    try {
        _UploadImage -Path $Path -Key $Key
    }
    catch {
        $_.Exception.Response
    }
}