# ls .\bruh\ | % {.\qpdf-10.6.3\bin\qpdf.exe $_.FullName --decrypt "$($_.BaseName).unlocked.pdf"}
[CmdletBinding()]
param (
	[Parameter()]
	$Path
)

$qpdfHome = Get-Item $PSScriptRoot\qpdf*

if(!$qpdfHome){
	Invoke-WebRequest -UseBasicParsing
}
	
& "$qpdfHome\bin\qpdf.exe" $Path --decrypt "$path.unlocked.pdf"