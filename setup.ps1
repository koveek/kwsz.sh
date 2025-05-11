$KwszDir = "$env:USERPROFILE\.kwsz"
$KwszScript = "$KwszDir\kwsz.ps1"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git is not installed. Exiting..." -ForegroundColor Red -BackgroundColor Black
    Exit 1
}

if (-not (Test-Path -Path $KwszDir)) {
    git clone https://kwsz.sh/scripts $KwszDir
}

$KwszFunction = @"
function kwsz {
    `$currentPolicy = Get-ExecutionPolicy -Scope CurrentUser
    if (`$currentPolicy -ne 'Bypass') {
        Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
    }
    & $KwszScript @args
}
"@

if (-not (Test-Path -Path $PROFILE)) {
    New-Item -Path $PROFILE -ItemType File
}

if (-not (Get-Content $PROFILE | Select-String "function kwsz")) {
    Add-Content -Path $PROFILE -Value "`n$KwszFunction"
}
