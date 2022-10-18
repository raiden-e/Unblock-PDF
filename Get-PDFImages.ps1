function Get-PDFImages {
    $ErrorActionPreference = "Stop"
    $pdfHome = Get-ChildItem -Directory | ? { $_.Name -match "(?:xpdf-tools|pdfimages)" } | Select-Object -First 1

    if ($pdfHome) {
        return $pdfHome
    }
    $rest = Invoke-WebRequest "https://www.xpdfreader.com/download.html"
    $asset = $rest.links | ? { $_.href -match "xpdf-tools-win-.+\.zip$" }

    Invoke-WebRequest -UseBasicParsing -OutFile "pdfimages.zip" $asset.href
    Expand-Archive "pdfimages.zip" -DestinationPath $PSScriptRoot
    Remove-Item "pdfimages.zip"

    return Get-Item "$PSScriptRoot\pdfimages*"
}