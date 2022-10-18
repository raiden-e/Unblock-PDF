function Get-QPDF {
    $ErrorActionPreference = "Stop"
    $qpdfHome = Get-Item "$PSScriptRoot\qpdf*" -ErrorAction Ignore

    if ($qpdfHome) {
        return [IO.Path]::Combine((Get-Item "$PSScriptRoot\qpdf*"), "bin")
    }
    $rest = Invoke-RestMethod -Uri "https://api.github.com/repos/qpdf/qpdf/releases/latest"
    $asset = $rest.assets | Where-Object { $_.name -like "*mingw64*.zip" }

    Invoke-WebRequest -UseBasicParsing -OutFile "qpdf.zip" $asset.browser_download_url.tostring()
    Expand-Archive "qpdf.zip" -DestinationPath $PSScriptRoot
    Remove-Item "qpdf.zip"

    return Get-Item "$PSScriptRoot\qpdf*"
}