## This script makes an Inventory of all applications installed from MECM and saves the output in a CSV file. Inventory is based on the Application Name, install command, detection method, dependency, and packaging information. The output is saved in a CSV file.

## Connect to the MECM server (will feature a prompt for naming the server with credentials)
$MECMServer = Read-Host "Enter the MECM server name to connect to"
$MECMCredential = Get-Credential

## Get all the applications installed from MECM and their details
$MECMApps = Get-CimInstance -ComputerName $MECMServer -Namespace "root\SMS\site_<SiteCode>" -ClassName "SMS_Application" -Credential $MECMCredential | Select-Object Name, InstallCommandLine, DetectionMethod, Dependencies, PackageID

## Save the output in a CSV file
$MECMApps | Export-Csv -Path "C:\MECMAppInventory.csv" -NoTypeInformation