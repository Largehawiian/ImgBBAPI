<#
.SYNOPSIS
    Function to upload a file to ImgBB.com via the API
.DESCRIPTION
    Converts an image to base64 and uploads it to ImgBB.com via the API
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    https://api.imgbb.com/
.EXAMPLE
    _UploadImage -ApiKey '1234567890' -Image 'C:\Temp\image.png'
    Uploads the image to ImgBB.com and returns the URL
#>

Function _UploadImage {
    Param(
        [String]$path,
        [String]$key
    )
    $Form = @{
        image = [convert]::ToBase64String((get-content $path -AsByteStream))
    } 
    try {
        $response = Invoke-RestMethod -Method POST  -Uri ("https://api.imgbb.com/1/upload?key={0}" -f $Key) -Body $Form
    }
    catch {
        $_.Exception.Response
    }
    return $response.data
}