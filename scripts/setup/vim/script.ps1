$VimRcPath = "$env:USERPROFILE\.vimrc"
$Force = $args.Count -gt 0 -and $args[0] -eq "-f"

if ((-not (Test-Path -Path $VimRcPath)) -or $Force) {
    Copy-Item "$PSScriptRoot\.vimrc" -Destination $VimRcPath -Force
    Write-Host $VimRcPath
}
