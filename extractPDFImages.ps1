# Example: .\bruh.pdf | extractPDFImages.ps1 -Output .\bruh
[CmdletBinding()]
param (
    [Parameter(ValueFromPipeline, Mandatory)]
    $InputObject,
    $Output = $pwd,
    [Parameter()]
    [Alias("j")]
    [switch]$jpeg
)

. "$PSScriptRoot\Get-QPDF.ps1"
$qpdfHome = Get-QPDF

$pdfImages = Get-Item "pdfimages.exe"

if ($jpeg) {
    & $pdfImages -j $InputObject $Output
    return
}
& $pdfImages $InputObject $Output
# Convert to webp on photopea
