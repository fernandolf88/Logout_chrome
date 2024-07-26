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

$preferencesValue = '{"homepage": "'+$homePage+'", "startup_urls": ["'+ $homePage +'"]}'
New-Item -ItemType Directory - Path "$chromeUserDataPath\Default" -Force
New-Item -ItemType File -Path "$chromeUserDataPath\Default\Preferences" -Value $preferencesValue

$shortcutPath = "C:\Users\$userName\Desktop\Chrome Avicenna.lnk"
$targetPath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$arguments = "--profile-directory=Default"

Remove-Item -Path "C:\Users\$userName\Desktop\*.lnk" -Force

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
$shortcut = New-Object -ComObject WScript.Shell
$shortcut.CreateShortcut($shortcutPath).TargetPath = $targetPath
$shortcut.CreateShortcut($shortcutPath).Arguments = $arguments

Write-Host "Script executado com exito."