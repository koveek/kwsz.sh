$ArgsPath = $args -join "\"
$ScriptDir = "$PSScriptRoot\scripts\$ArgsPath"
$Script = "$ScriptDir\script.ps1"

if (Test-Path -Path $Script) {
    & $Script
}
