# Remover todos os perfis do Chrome
$userName = $env:USERNAME
$chromeUserDataPath = "C:\Users\$userName\AppData\Local\Google\Chrome\User Data"

# Obter lista de diretórios de perfil
$profileDirectories = Get-ChildItem -Path $chromeUserDataPath 

# Remover cada diretório de perfil
foreach ($profileDirectory in $profileDirectories) {
    Remove-Item -Path $profileDirectory.FullName -Force -Recurse
}

Remove-Item -Path "C:\Users\$userName\Desktop\*.lnk" -Force

Expand-Archive -Path "C:\script\User.zip" -DestinationPath "C:\Users\$userName\AppData\Local\Google\Chrome\" -Force

[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')

$form = New-Object System.Windows.Forms.Form
$form.Text = "Tarefa Finalizada"
$form.Size = New-Object System.Drawing.Size(300, 100)

$label = New-Object System.Windows.Forms.Label
$label.Text = "A tarefa foi finalizada com sucesso."
$label.Location = New-Object System.Drawing.Point(30, 30)
$form.Controls.Add($label)
$form.ShowDialog()