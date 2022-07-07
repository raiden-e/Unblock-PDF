# ls .\bruh\ | % {.\qpdf-10.6.3\bin\qpdf.exe $_.FullName --decrypt "$($_.BaseName).unlocked.pdf"}
[CmdletBinding()]
param (
    [Parameter(ValueFromPipeline, Mandatory)]
    $Path
)

Remove-Item "qpdf.zip" -ErrorAction Ignore
$qpdfHome = Get-Item "$PSScriptRoot\qpdf*"

if (!$qpdfHome) {
    $Release = Invoke-WebRequest -UseBasicParsing "https://github.com/qpdf/qpdf/releases/latest"
    $Release = $Release.Links.href | Where-Object { $_ -like "*mingw64*" }
    Invoke-WebRequest -UseBasicParsing "https://github.com/$Release"  -OutFile "qpdf.zip" -ErrorAction Stop
    Expand-Archive "qpdf.zip" -DestinationPath $PSScriptRoot -ErrorAction Stop
    Remove-Item "qpdf.zip"

    $qpdfHome = Get-Item "$PSScriptRoot\qpdf*"
}

& "$qpdfHome\bin\qpdf.exe" $Path --decrypt "$path.unlocked.pdf"