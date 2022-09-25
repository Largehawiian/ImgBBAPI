function _ScreenCapture{
    param(
        [String]$Key,
        [Switch]$OfWindow
    )
    begin {
        Add-Type -AssemblyName System.Drawing
    }
    process {
        Start-Sleep -Milliseconds 250
        if ($OfWindow) {
            [Windows.Forms.Sendkeys]::SendWait("%{PrtSc}")
        } else {
            [Windows.Forms.Sendkeys]::SendWait("{PrtSc}")
        }
        Start-Sleep -Milliseconds 250
        $bitmap = [Windows.Forms.Clipboard]::GetImage()
        $Stream = [IO.MemoryStream]::new() 
        $bitmap.Save($Stream, [Drawing.Imaging.ImageFormat]::Jpeg)
        [byte[]]$ImageByes = $Stream.ToArray()
        _UploadStream -Image $ImageByes -Key $Key -OpenInBrowser
    }
}