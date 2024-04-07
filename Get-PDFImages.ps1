function Get-PDFImages {
    [CmdletBinding()]
    param (
        [Parameter()]
        $Location = $PWD
    )
    function Get-PDFImagesDir { return Get-ChildItem -Directory $Location | ? { $_.Name -match "(?:xpdf-tools|pdfimages)" } | Select-Object -First 1 }
    $pdfHome = Get-PDFImagesDir

    if ($pdfHome) {
        return $pdfHome
    }
    $rest = Invoke-WebRequest "https://www.xpdfreader.com/download.html" -UseBasicParsing
    $asset = $rest.links | ? { $_.href -match "xpdf-tools-win-.+\.zip$" }

    Invoke-WebRequest -UseBasicParsing -OutFile "pdfimages.zip" $asset.href -ErrorAction Stop
    Expand-Archive "pdfimages.zip" -DestinationPath $PSScriptRoot
    Remove-Item "pdfimages.zip"

    return Get-PDFImagesDir
}