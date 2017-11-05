netsh advfirewall firewall delete rule profile=any name="systemclient"
netsh advfirewall firewall delete rule profile=any name="VNC Server"
netsh advfirewall firewall add rule name="systemclient" profile=any protocol=TCP enable=yes DIR=In program="%ProgramFiles%\PhilleConnect\systemclient.exe" Action=Allow
netsh advfirewall firewall add rule name="systemclient" profile=any protocol=UDP enable=yes DIR=In program="%ProgramFiles%\PhilleConnect\systemclient.exe" Action=Allow
netsh advfirewall firewall add rule name="VNC Server" profile=any protocol=TCP enable=yes DIR=In program="%ProgramFiles%\PhilleConnect\vnc\winvnc.exe" Action=Allow
netsh advfirewall firewall add rule name="VNC Server" profile=any protocol=UDP enable=yes DIR=In program="%ProgramFiles%\PhilleConnect\vnc\winvnc.exe" Action=Allow
