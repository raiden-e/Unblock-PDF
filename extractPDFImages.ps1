# Example: .\bruh.pdf | extractPDFImages.ps1 -Output .\bruh
[CmdletBinding()]
param (
    [Parameter(ValueFromPipeline, Mandatory)]
    $InputObject,
    $Output = "$pwd\output"
)

. "$PSScriptRoot\Get-PDFImages.ps1"
$pdfImagesHome = Get-PDFImages

$pdfImages = Get-Item "$pdfImagesHome\bin64\pdfimages.exe"

New-Item -ItemType Directory $Output -Force

& $pdfImages -j $InputObject "$Output\out"
