# ClientSetup-Windows
PhilleConnect Client installer for Windows  
This installer will setup your Windows machine to use it as a Client for PhilleConnect.

# Compatiblity
PhilleConnect Client for Windows is currently compatible with:  
Windows 7 SP1 (64-Bit)  
Windows 8.1 (64-Bit)  
Windows 10 (64-Bit) (Tested with 1709)

# Requirements
To use this programs you need a working PhilleConnect Server.

# Configuration
The Installer comes with a file called 'pcconfig.jkm'. This is a text file used to configure the client machine. It's recommended to edit this file before you install PhilleConnect, otherwise you have to edit the file on every single machine. There's also a tool to auto-generate this file on the admin-console of your server.
You can configure these values:  

| name                 | values    | description |
| -------------------- | --------- | ----------- |
| server               | string    | IP, IP:Port, Hostname, Hostname:Port of your PhilleConnect Server |
| global               | string    | the installation key of your installation, you will find this in the administration backend |
| allowOffline         | 0 or 1    | 0: will shutdown; 1: will go to the desktop if the server is not available |
| badNetworkReconnect  | integer   | how many times the machine should try to connect to the server |

# Other
The installer is built with 'InnoScript Setup', to compile your own installer you first have to download the InnoScript Compiler, then compile the .iss file.

# Source code
The source code of all PhilleConnect client applications is a now available on GitHub!
