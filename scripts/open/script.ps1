$KwszDir = "$env:USERPROFILE\.kwsz"
if(Test-Path $KwszDir) {
    explorer $KwszDir
}
