:: Deprecated, deletes tasks from v1
schtasks /Delete /TN "RunOnceCreator" /f
:: Create new tasks
schtasks /create /TN "Systemclient" /XML "C:\Program Files\PhilleConnect\Systemclient.xml"
schtasks /create /TN "SystemclientUser" /XML "C:\Program Files\PhilleConnect\SystemclientUser.xml"
