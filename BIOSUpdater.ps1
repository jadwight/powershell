clear
$version = 'v0.1'
Write-Host ' ===================================================='
Write-Host "|        BIOS Updater $version by Joshua Dwight          |"
Write-Host '| Find more scripts online @ https://github/jadwight |'
Write-Host ' ===================================================='
Write-Host ''
Write-Host 'Please Note: Currently this is for Dell Computers Only!'
Write-Host ''

# Repository Settings
$enable_repository = 0   # 0 = disabled ; 1 = enabled ### In case you want to store BIOS files on a network share
$repository_path = '\\server\share'

# BIOS Library
$bios_library = @(
[pscustomobject]@{Model='Dell XPS420';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Inspiron 530s';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Latitude 3580';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Latitude 7389';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Latitude E5530 non-vPro';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Latitude E6500';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Latitude E6530';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 320';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 330';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 380';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 390';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 760';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 790';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 960';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 990';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 3010';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 3070';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 5090';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 5270 AIO';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 7010';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 7020';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 7080';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 9010';BIOS='BIOS.exe'}
[pscustomobject]@{Model='OptiPlex 9010 AIO';BIOS='BIOS.exe'}
[pscustomobject]@{Model='PowerEdge T320';BIOS='BIOS.exe'}
[pscustomobject]@{Model='PowerEdge R520';BIOS='BIOS.exe'}
[pscustomobject]@{Model='PowerEdge R610';BIOS='BIOS.exe'}
[pscustomobject]@{Model='PowerEdge R620';BIOS='BIOS.exe'}
[pscustomobject]@{Model='PowerEdge R640';BIOS='BIOS.exe'}
[pscustomobject]@{Model='PowerEdge T710';BIOS='BIOS.exe'}
[pscustomobject]@{Model='PowerVault 500';BIOS='BIOS.exe'}
[pscustomobject]@{Model='PowerVault NX3000';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Precision 7750';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Precision T1650';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Vostro 260s';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Vostro 1540';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Vostro 2520';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Vostro 3558';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Vostro 3560';BIOS='BIOS.exe'}
[pscustomobject]@{Model='Vostro 3700';BIOS='BIOS.exe'}
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



# EXPERIMENTAL # # # # # # # # # # #
$t1 = 'A22'
$t2 = 'A21'
$t3 = 'A23'

if ($t2 -gt $t1) {
write-host 'Greater'
} else {write-host 'not greater'}

# # # # # # # # # # # # # # # # # # 