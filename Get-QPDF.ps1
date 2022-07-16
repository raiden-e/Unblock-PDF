function Get-QPDF {
    Remove-Item "$PSScriptRoot\qpdf.zip" -ErrorAction Ignore
    $qpdfHome = Get-Item "$PSScriptRoot\qpdf*"

    if (!$qpdfHome) {
        $Release = Invoke-WebRequest -UseBasicParsing "https://github.com/qpdf/qpdf/releases/latest"
        $Release = $Release.Links.href | Where-Object { $_ -like "*mingw64*" }
        Invoke-WebRequest -UseBasicParsing "https://github.com/$Release"  -OutFile "qpdf.zip" -ErrorAction Stop
        Expand-Archive "qpdf.zip" -DestinationPath $PSScriptRoot -ErrorAction Stop
        Remove-Item "qpdf.zip"
    }

    return Get-Item "$PSScriptRoot\qpdf*"
}