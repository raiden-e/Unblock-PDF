# Example: .\bruh.pdf | extractPDFImages.ps1 -Output .\bruh
[CmdletBinding()]
param (
    [Parameter(ValueFromPipeline, Mandatory)]
    $InputObject,
    $Output = $pwd
)

. "$PSScriptRoot\Get-QPDF.ps1"
$qpdfHome = Get-QPDF

$pdfImages = Get-Item "pdfimages.exe"

& $pdfImages -j $InputObject $Output
