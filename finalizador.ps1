# Remover todos os perfis do Chrome
$userName = $env:USERNAME
$chromeUserDataPath = "C:\Users\$userName\AppData\Local\Google\Chrome\User Data"

# Obter lista de diretórios de perfil
$profileDirectories = Get-ChildItem -Path $chromeUserDataPath 

Get-Process -Verbose:$false

# Remover cada diretório de perfil
foreach ($profileDirectory in $profileDirectories) {
    Remove-Item -Path $profileDirectory.FullName -Force -Recurse
}

Remove-Item -Path "C:\Users\$userName\Desktop\*.lnk" -Force

Expand-Archive -Path "C:\script\User.zip" -DestinationPath "C:\Users\$userName\AppData\Local\Google\Chrome\" -Force

Write-Host "Script executado com exito."