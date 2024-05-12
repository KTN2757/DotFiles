winfetch
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\plague.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons
Import-Module PSReadLine
# Import-Module z
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
function touch($file){
  "" | Out-File $file -Encoding ASCII 
}
function which($name){
  Get-Command $name | Select-Object -ExpandProperty Definition
}
function digclk {
 $scriptPath = Resolve-Path -Path 'C:\Github\Digital Clock\digclk.ps1'
 & $scriptPath
}
