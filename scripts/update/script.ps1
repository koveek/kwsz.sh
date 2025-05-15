$DirectoryBeforeUpdate = Get-Location
$KwszDir = "$env:USERPROFILE\.kwsz"

Set-Location $KwszDir
git pull

if($LASTEXITCODE -ne 0) { # $LASTEXITCODE of zero typically indicates success, so it checks if git pull has failed
    Write-Host "Kwsz could not be updated. Exiting..." -ForegroundColor Red -BackgroundColor Black
    Exit 1
}
Set-Location $DirectoryBeforeUpdate
Write-Host $KwszDir