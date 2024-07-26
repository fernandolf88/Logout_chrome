# Remover todos os perfis do Chrome
$userName = $env:USERNAME
$chromeUserDataPath = "C:\Users\$userName\AppData\Local\Google\Chrome\User Data"
$homePage = "https://www.colegioavicenna.com.br"

# Obter lista de diretórios de perfil
$profileDirectories = Get-ChildItem -Path $chromeUserDataPath 

# Remover cada diretório de perfil
foreach ($profileDirectory in $profileDirectories) {
    Remove-Item -Path $profileDirectory.FullName -Force -Recurse
}

Remove-Item -Path "C:\Users\$userName\Desktop\*.lnk" -Force

$preferencesValue = '{"homepage": "'+$homePage+'", "startup_urls": ["'+ $homePage +'"]}'
New-Item -ItemType Directory -Path "$chromeUserDataPath\Default" -Force
New-Item -ItemType File -Path "$chromeUserDataPath\Default\Preferences" -Value $preferencesValue

$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"  # Substitua por seu caminho do Chrome
$shortcutTarget = "$chromePath --profile-directory=Default"
New-Item -ItemType File -Path "$chromeUserDataPath\Default\atalho.lnk" -Force
(Get-Item "$chromeUserDataPath\Default\atalho.lnk").Shortcut.TargetPath = $shortcutTarget
Copy-Item "$chromeUserDataPath\Default\atalho.lnk" "C:\Users\$userName\Desktop\Colégio Avicenna.lnk" -Force

Write-Host "Script executado com exito."