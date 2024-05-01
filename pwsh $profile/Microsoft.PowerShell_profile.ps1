winfetch
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\plague.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons
Import-Module PSReadLine
Import-Module z
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
function digclk {
 $scriptPath = Resolve-Path -Path 'C:\Github\Digital Clock\digclk.ps1'
 & $scriptPath
}
