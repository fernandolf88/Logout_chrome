@ECHO ON

set url=https://raw.githubusercontent.com/fernandolf88/Logout_chrome/main/finalizador.ps1
mkdir C:\script\
set output = C:\script\logout.ps1
curl %url% -o %output%
schtasks /create /tn "Logout Chrome" /tr "powershell.exe -ExecutionPolicy Bypass -File C:\script\logout.ps1" /sc onstart
attrib +h c:\script