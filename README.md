# ImgBBAPI

### Requires Powershell 7

### Function to upload to ImgBB's API
```powershell
# To use the function, either paste it in your terminal or dot source it.
# . .\UploadImage.ps1
_UploadImage -Path "C:\Temp\Image.png" -Key "Your Key" -OpenInBrowser
```
### Upload Script
```powershell
.\ImageUploadScript.ps1 -Path "C:\Temp\Image.png" -Key "Your Key" -OpenInBrowser
# Upload all images in a folder
.\ImageUploadScript.ps1 -Path "C:\Temp\" -Key "Your Key" -UploadFolder
```
### Get Help
```powershell
Get-Help .\ImageUploadScript.ps1
```