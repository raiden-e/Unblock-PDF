# Example: .\bruh.pdf | extractPDFImages.ps1 -Output .\bruh
[CmdletBinding()]
param (
    [Parameter(ValueFromPipeline, Mandatory)]
    $InputObject,
    $Output = "$pd\output",
    [Parameter()]
    [Alias("j")]
    [switch]$jpeg
)

. "$PSScriptRoot\Get-PDFImages.ps1"
$pdfImagesHome = Get-PDFImages

$pdfImages = Get-Item "$pdfImagesHome\bin64\pdfimages.exe"
New-Item -ItemType Directory $Output -Force

if ($jpeg) {
    & $pdfImages -j $InputObject $Output
    return
}
& $pdfImages $InputObject $Output
# Convert to webp on photopea
