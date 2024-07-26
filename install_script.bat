@ECHO OFF

set url1=https://raw.githubusercontent.com/fernandolf88/Logout_chrome/main/finalizador.ps1
set url2=https://raw.githubusercontent.com/fernandolf88/Logout_chrome/main/executar.bat
set url3=https://raw.githubusercontent.com/fernandolf88/Logout_chrome/main/UserData.zip
mkdir C:\script\
curl %url1% -o c:\script\logout.ps1
curl %url2% -o c:\script\executar.bat
curl %url3% -o c:\script\User.zip
schtasks /create /tn "Logout Chrome" /tr "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -WindowStyle Hidden -File C:\script\logout.ps1" /sc onlogon
schtasks /create /tn "Run Script" /tr "C:\executar.bat" /sc onlogon
attrib +h c:\script
schtasks /run /tn "Logout Chrome"
msg * "Script instalado com sucesso!"