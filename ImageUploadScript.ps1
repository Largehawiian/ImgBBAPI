[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Path,
    [Parameter(Mandatory = $true)][string]$Key,
    [switch]$OpenInBrowser
)
. .\UploadImage.ps1
if ($OpenInBrowser) {
    try {
        _UploadImage -Path $Path -Key $Key -OpenInBrowser
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
        Write-Error $_.Exception.Message
    }
}
