# ls .\bruh\ | % {.\qpdf-10.6.3\bin\qpdf.exe $_.FullName --decrypt "$($_.BaseName).unlocked.pdf"}
[CmdletBinding()]
param (
    [Parameter(ValueFromPipeline, Mandatory)]
    $Path
)

. "$PSScriptRoot\Get-QPDF.ps1"
$qpdfHome = Get-QPDF

& "$qpdfHome\qpdf.exe" $Path --decrypt "$path.unlocked.pdf"
