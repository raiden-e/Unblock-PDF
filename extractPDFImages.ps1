# Example: .\bruh.pdf | extractPDFImages.ps1 -Output .\bruh
[CmdletBinding()]
param (
    [Parameter(ValueFromPipeline, Mandatory)]
    $InputObject,
    $Output = $pwd
)

. "$PSScriptRoot\Get-QPDF.ps1"
$qpdfHome = Get-QPDF

& "$qpdfHome\bin\qpdf.exe" $Path --decrypt "$path.unlocked.pdf"
