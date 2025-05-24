$JetBrainsPath = "$env:APPDATA\JetBrains"
$ScriptKeymapPath = "$PSScriptRoot\keymaps"


Get-ChildItem -Path $JetBrainsPath -Directory | 
Where-Object { $_.BaseName -match "\d$" } | # Each JetBrains IDE has a version number at the end of its folder name
Select-Object Name | ForEach-Object {
    $FullKeymapPath = "$JetBrainsPath\$($_.Name)" 
    Copy-Item -Path $ScriptKeymapPath -Destination $FullKeymapPath -Recurse -Force
    Write-Host $FullKeymapPath
}

$IdeaVimRcPath = "$env:USERPROFILE\.ideavimrc"
Copy-Item "$PSScriptRoot\.ideavimrc" -Destination $IdeaVimRcPath -Force
Write-Host $IdeaVimRcPath