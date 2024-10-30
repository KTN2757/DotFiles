winfetch
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\plague.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons
Import-Module PSReadLine
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile))
{
  Import-Module "$ChocolateyProfile"
}
function touch($file)
{
  "" | Out-File $file -Append -NoNewLine -NoClobber -Encoding ASCII
}
function which($name)
{
  Get-Command $name | Select-Object -ExpandProperty Definition
}
function digclk
{
  $scriptPath = Resolve-Path -Path 'D:\Github\dig-clock\digclk.ps1'
  & $scriptPath
}
