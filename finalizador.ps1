# Remover todos os perfis do Chrome
$userName = $env:USERNAME
$chromeUserDataPath = "C:\Users\$userName\AppData\Local\Google\Chrome\User Data"

# Obter lista de diretórios de perfil
$profileDirectories = Get-ChildItem -Path $chromeUserDataPath 

# Remover cada diretório de perfil
foreach ($profileDirectory in $profileDirectories) {
    Remove-Item -Path $profileDirectory.FullName -Force -Recurse
}

New-Item -ItemType Directory -Path "$chromeUserDataPath\Default"
New-Item -ItemType File -Path "$chromeUserDataPath\Default\Preferences" -Value '{"homepage": "https://www.google.com"}'

Remove-Item -Path "C:\Users\$userName\Desktop\*Chrome*.lnk" -Force
Write-Host "Script executado com exito."