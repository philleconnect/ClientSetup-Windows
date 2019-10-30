@echo off
:START
if exist %SYSTEMROOT%\SYSTEM32\WDI\LOGFILES (
	goto ADMIN
) else (
	echo Dieses Skript benoetigt Adminrechte. Bitte starte es mittels Rechtsklick - Als Administrator ausfuehren
	goto END
)
:ADMIN
echo Dieses Skript wird alle Dateien und Einstellungen von PhilleConnect auf diesem Computer entfernen.
echo Gib "DELETE" ein, um PhilleConnect zu loeschen.
echo Eine andere Eingabe bricht den Prozess ab.
echo Druecke Enter zum Bestaetigen.
set /p EINGABE=Eingabe: 
if "%EINGABE%"=="DELETE" (
	goto DOIT
) else (
	echo Abgebrochen.
	goto END
)
:DOIT
echo PhilleConnect-Programme beenden...
taskkill /F /IM dkmp.exe /IM systemclient.exe /IM winvnc.exe
taskkill /F /IM PhilleConnectStart.exe
taskkill /F /IM PhilleConnectDrive.exe
taskkill /F /IM PhilleConnectTeacher.exe
echo Firewall-Regeln werden entfernt...
netsh advfirewall firewall delete rule profile=any name="systemclient"
netsh advfirewall firewall delete rule profile=any name="VNC Server"
echo Geplante Aufgaben werden entfernt...
schtasks /Delete /TN "Systemclient" /f
schtasks /Delete /TN "SystemclientUser" /f
echo Registry-Eintraege werden entfernt...
if "%version%" == "10.0" (
	reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v AsyncRunOnce /f
)
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v PhilleConnectDrive /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v PhilleConnectTeacher /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DelayedDesktopSwitchTimeout /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v RunLogonScriptSync /f
echo PhilleConnect-Dateien werden entfernt...
set drive="PhilleConnect Drive.lnk"
set teacher="PhilleConnect Teacher.lnk"
if exist "C:\Program Files\PhilleConnect" (
	RMDIR /S /Q "C:\Program Files\PhilleConnect"
)
if exist C:\Users\Public\Desktop\%drive% (
	DEL /S /Q C:\Users\Public\Desktop\%drive%
)
if exist C:\Users\Public\Desktop\%teacher% (
	DEL /S /Q C:\Users\Public\Desktop\%teacher%
)
if exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PhilleConnect" (
	RMDIR /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PhilleConnect"
)
%~dp0gpdelete.exe
echo PhilleConnect wurde erfolgreich deinstalliert.
:END
PAUSE
