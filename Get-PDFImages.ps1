function Get-PDFImages {
    [CmdletBinding()]
    param (
        [Parameter()]
        $Location = $PWD
    )
    function getPdf { return Get-ChildItem -Directory $Location | ? { $_.Name -match "(?:xpdf-tools|pdfimages)" } | Select-Object -First 1 }
    $pdfHome = getPdf

    if ($pdfHome) {
        return $pdfHome
    }
    $rest = Invoke-WebRequest "https://www.xpdfreader.com/download.html" -UseBasicParsing
    $asset = $rest.links | ? { $_.href -match "xpdf-tools-win-.+\.zip$" }

    Invoke-WebRequest -UseBasicParsing -OutFile "pdfimages.zip" $asset.href
    Expand-Archive "pdfimages.zip" -DestinationPath $PSScriptRoot
    Remove-Item "pdfimages.zip"

    return getPdf
}