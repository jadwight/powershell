# Hardware-Reporter
# Author: "JD" (Joshua Dwight)
# 
# A Basic Asset Data Collector that is PowerShell-based. Purpose of program is to collect data and then dump into a simple INI-based Database.
# A useful tool for Network Administrators looking to obtain information on computers in their network.
# 
# Data Collected:
# Host Name
# IP Address
# Mac Address
# RAM Max Capacity
# RAM Installed
# Hard Drive Capacity
# Hard Drive Free Space
# Hard Drive Make/Model
# Motherboard Manufacturer
# Computer Manufacturer
# Computer Model Number
# Windows Major Release (i.e. Windows XP, Windows Vista, Windows 8/8.1/10)
# Windows Version Number
# Windows Activation Status

# CONFIGURATION #
$verboseoutput = 1 # 1 = on; 0 = off # When enabled more information is printed in console.

if ($verboseoutput -eq '1') {
Clear-Host   # clear screen on script start if verbose output is set to 1 (to aid in bug tracking)
}

$datafilename = ($env:COMPUTERNAME + '.ini') # Set data filename to be the name of the computer
$datadumplocation = ("$env:temp\" + $datafilename) # set dump location to be temp directory
if ($verboseoutput -eq "1") {
    Write-Host 'Data File: ' $datadumplocation    # if verboseoutput is 1 then display output to screen
}

### DATA COLLECTION ###

$pcname = ($env:COMPUTERNAME) # Get Host Name
if ($verboseoutput -eq '1') {
    Write-Host 'Host Name: ' $pcname # if verboseoutput is 1 then display output to screen
}

# IP Address
$hostip = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias 'Ethernet*').IPAddress
if ($verboseoutput -eq '1') {
    Write-Host 'IP: ' $hostip
}

# Mac Address
$hostmac = (Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IpAddress -eq $hostip }).MACAddress
if ($verboseoutput -eq '1') {
    Write-Host 'Mac: ' $hostmac
}

# RAM Max Capacity
# RAM Installed
# Hard Drive Capacity
# Hard Drive Free Space
# Hard Drive Make/Model
# Motherboard Manufacturer
# Computer Manufacturer
# Computer Model Number
# Windows Major Release (i.e. Windows XP, Windows Vista, Windows 8/8.1/10)
# Windows Version Number
# Windows Activation Status

# EXPORT DATA TO INI FILE
# UPLOAD INI FILE TO DATASTORE
## upload file to directory where another program will merge INI files into a master db