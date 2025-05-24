$JetBrainsPath = "$env:APPDATA\JetBrains"
$ScriptKeymapPath = "$env:USERPROFILE\.kwsz\scripts\setup\jb"

Get-ChildItem -Path $JetBrainsPath -Directory | 
Where-Object { $_.BaseName -match "\d$" } | # Each JetBrains IDE has a version number at the end of its folder name
Select-Object Name | ForEach-Object {
    $FullKeymapPath = "$JetBrainsPath\$($_.Name)\keymaps"
    Copy-Item -Path $FullKeymapPath -Destination $ScriptKeymapPath -Recurse -Force
    Write-Host $ScriptKeymapPath
}

$IdeaVimRcPath = "$env:USERPROFILE\.ideavimrc"
Copy-Item $IdeaVimRcPath -Destination $ScriptKeymapPath -Force
Write-Host $IdeaVimRcPath