# Example: .\bruh.pdf | extractPDFImages.ps1 -Output .\bruh
[CmdletBinding()]
param (
    [Parameter(ValueFromPipeline, Mandatory)]
    $InputObject,
    $Output = "$pwd\output",
    [Parameter()]
    [Alias("j")]
    [switch]$jpeg
)

$ErrorActionPreference = "Stop"

. "$PSScriptRoot\Get-PDFImages.ps1"
$pdfImagesHome = Get-PDFImages
if (!$pdfImagesHome) {
    throw "Could not get pdfImages bins"
}
Write-Host "Got pdf images binaries"

$pdfImages = Get-Item "$pdfImagesHome\bin64\pdfimages.exe"
New-Item -ItemType Directory $Output -Force

$argumentList = $InputObject, "$OutPut"
if ($jpeg) {
    $argumentList = "-j", """$InputObject""", "$OutPut\"
}
Write-Host "$pdfImages $($argumentList -join " ")"
Start-Process $pdfImages -ArgumentList $argumentList -NoNewWindow

# Convert to webp on photopea
