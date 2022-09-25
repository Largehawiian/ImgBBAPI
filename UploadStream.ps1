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
.EXAMPLE
    _UploadImage -ApiKey '1234567890' -Image 'C:\Temp\image.png' -OpenInBrowser
    Uploads the image to ImgBB.com, returns the URL and opens it in the default browser
#>

Function _UploadStream {
    Param(
        [byte[]]$Image,
        [String]$key,
        [Switch]$OpenInBrowser
    )
    $Form = @{
        image = [convert]::ToBase64String($image)
    } 
    try {
        $response = Invoke-RestMethod -Method POST `
        -Uri ("https://api.imgbb.com/1/upload?key={0}&Name={1}" -f $Key,$Env:COMPUTERNAME+"-"+(Get-Date -Format "MM-dd-yyyy-HH:mm")) -Body $Form
    }
    catch {
        $_.Exception.Response
    }
    $output = [PSCustomObject]@{
        Image = $response.data.display_url
        ShortURL = $response.data.url_viewer
        DeleteURL = $response.data.delete_url
        ThumbnailURL = $response.data.thumb.url
        MediumURL = $response.data.medium.url
    }
    if ($OpenInBrowser) {
        Start-Process $output.Image
    }
    return $output
}