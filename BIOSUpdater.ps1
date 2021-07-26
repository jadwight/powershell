clear
$version = 'v0.1'
Write-Host ' ===================================================='
Write-Host "|        BIOS Updater $version by Joshua Dwight          |"
Write-Host '| Find more scripts online @ https://github/jadwight |'
Write-Host ' ===================================================='
Write-Host ''
Write-Host 'Please Note: Currently this is for Dell Computers Only!'
Write-Host ''

# BIOS Library
$bios_library = @(
[pscustomobject]@{Model='Latitude E6530';BIOS='BIOS.exe'}
)

# Computer Models
$supported_models = $bios_library | ForEach-Object {$_.Model}
Write-Host 'Supported Models:'
Write-Host $supported_models
Write-Host ''
Write-Host ''

# Obtain Computer Manufacturer
Write-Host 'Obtaining PC Manufacturer...'
$pc_manufacturer = (Get-WmiObject -Class:Win32_ComputerSystem).Manufacturer
Write-Host $pc_manufacturer

# Obtain Computer Model
Write-Host 'Obtaining PC Model Number...'
$pc_model = (Get-WmiObject -Class:Win32_ComputerSystem).Model
Write-Host $pc_model

# Obtain Current BIOS Version
Write-Host 'Obtaining current BIOS version...'
$bios_version = (Get-WmiObject win32_bios).Name
Write-Host $bios_version

$t1 = 'A22'
$t2 = 'A21'
$t3 = 'A23'

if ($t2 -gt $t1) {
write-host 'Greater'
} else {write-host 'not greater'}