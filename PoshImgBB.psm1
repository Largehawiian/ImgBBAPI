# Importing public and private functions
$PSScript = $PSScriptRoot
$Func = @(Get-ChildItem -Recurse -Filter "*.ps1" -Path $PSScript -ErrorAction Stop)
Set-ExecutionPolicy -ExecutionPolicy Bypass process
# Dotsourcing files
ForEach ($import in $Func) {
    Try {
        . $import.fullname
    }
    Catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

# Exporting just the Public functions
Export-ModuleMember -Function _ScreenCapture, _UploadFolder, _UploadImage, _UploadStream