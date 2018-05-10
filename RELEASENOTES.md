## Release Notes for PhilleConnect ClientSetup-Windows ##

### 1.2 (May 10, 2018)
* Screenshots for PhilleConnect Teacher are now created through systemclient. This resolves a bug causing a presses CTRL- of SHIFT-key to loose its pressed state every time a screenshot was taken through VNC.
* Removed the hard-coded password for the VNC server. Every time you want to remote-control a students machine an new dynamic password is created.

### WARNING: This breaks compatibility with earlier versions! If you update PhilleConnect Teacher you have to update systemclients (or vice-versa) on all machines configured in the same room to keep the screehshotting and remote-controlling working. Also, if you have a room with Windows and Linux mixed you have to update the Windows machines to this version to keep screenshots and remote-control working.
