$VimRcPath = "$env:USERPROFILE\.vimrc"
$VimRcSetupPath = "$env:USERPROFILE\.kwsz\scripts\setup\vim\.vimrc"

Copy-Item -Path $VimRcPath -Destination "$VimRcSetupPath" -Force
Write-Host $VimRcSetupPath
