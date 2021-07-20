# Hardware-Reporter
# Author: "JD" (Joshua Dwight)
# Worth Mentioning: Borrowed Convert-Size Function from Techibee.com for Size Conversions
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

# Techibee Convert-Size Function
# Source: https://techibee.com/powershell/convert-from-any-to-any-bytes-kb-mb-gb-tb-using-powershell/2376
function Convert-Size {            
    [cmdletbinding()]            
    param(            
        [validateset("Bytes","KB","MB","GB","TB")]            
        [string]$From,            
        [validateset("Bytes","KB","MB","GB","TB")]            
        [string]$To,            
        [Parameter(Mandatory=$true)]            
        [double]$Value,            
        [int]$Precision = 4            
    )            
    switch($From) {            
        "Bytes" {$value = $Value }            
        "KB" {$value = $Value * 1024 }            
        "MB" {$value = $Value * 1024 * 1024}            
        "GB" {$value = $Value * 1024 * 1024 * 1024}            
        "TB" {$value = $Value * 1024 * 1024 * 1024 * 1024}            
    }            
                
    switch ($To) {            
        "Bytes" {return $value}            
        "KB" {$Value = $Value/1KB}            
        "MB" {$Value = $Value/1MB}            
        "GB" {$Value = $Value/1GB}            
        "TB" {$Value = $Value/1TB}            
                
    }            
                
    return [Math]::Round($value,$Precision,[MidPointRounding]::AwayFromZero)            
                
    }         
# End of Techibee Function

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
$maxram = (wmic memphysical get maxcapacity)

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