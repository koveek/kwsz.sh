$KwszDir = "$env:USERPROFILE\.kwsz"
$KwszScript = "$KwszDir\kwsz.ps1"

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
        $progressPreference = 'silentlyContinue'
        Install-PackageProvider -Name NuGet -Force -Scope CurrentUser | Out-Null
        Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery -Scope CurrentUser | Out-Null
        Repair-WinGetPackageManager
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    winget install --id Git.Git -eh --source winget
    $env:Path=( # re-set the path to include git in the current session
        [Environment]::GetEnvironmentVariable("Path", "Machine"),
        [Environment]::GetEnvironmentVariable("Path", "User")
    ) -match '.' -join ';'
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
    Write-Host "Added kwsz function to profile. Restart the terminal to use it" -ForegroundColor Green -BackgroundColor Black
}

