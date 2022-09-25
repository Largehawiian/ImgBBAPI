# ImgBBAPI

### Requires Powershell 7

### Install Module
```powershell
    Install-Module PoshImgBB
    Import-Module PoshImgBB
    ```

### Capture Screenshot
```powershell
    _Screenshot -Key "Your Key" # Captures all monitors
    _Screenshot -Key "Your Key" -OfWindow # captures current window
```
### Function to upload to ImgBB's API
```powershell
# To use the function, either paste it in your terminal or dot source it.

_UploadImage -Path "C:\Temp\Image.png" -Key "Your Key" 
_UploadImage -Path "C:\Temp\Image.png" -Key "Your Key" -OpenInBrowser

# . .\UploadFolder.ps1
# Upload all images in a folder recursively.
# Recommended to use the included script shown below for file type validation.
Get-ChildItem -Path "C:\Temp\" | _UploadFolder -Key "Your Key"
```
### Upload Script
```powershell
.\ImageUploadScript.ps1 -Path "C:\Temp\Image.png" -Key "Your Key" -OpenInBrowser
# Upload all images in a folder
.\ImageUploadScript.ps1 -Path "C:\Temp\" -Key "Your Key" -UploadFolder
```
### Get Help
```powershell
Get-Help .\ImageUploadScript.ps1 -Examples
```