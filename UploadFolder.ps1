<#
.SYNOPSIS
    Function to upload files in a folder to ImgBB.com via the API
.DESCRIPTION
    Converts images to base64 and uploads it to ImgBB.com via the API
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    https://api.imgbb.com/
.EXAMPLE
    Get-ChildItem -Path 'C:\Temp' -Recurse -File -Include *.jpg,*.png,*.bmp,*.gif | _UploadFolder -Key '1234567890'
    Uploads the images to ImgBB.com and returns the URL
#>
Function _UploadFolder {
    Param(
        [String]$key,
        [parameter(ValueFromPipelineByPropertyName)]$FullName
    )
    begin {
        $FilesToProcess = [System.Collections.Generic.List[String]]::new()
    }
    process {
        if ($_.PSIsContainer) { return }
        $FilesToProcess.Add($FullName)
    }
    end {
        $FilesToProcess | ForEach-Object {
            $output = _UploadImage -path $_ -key $key
            $output | Add-Member -MemberType NoteProperty -Name 'FullName' -Value $_
            $output
        }
    }
}