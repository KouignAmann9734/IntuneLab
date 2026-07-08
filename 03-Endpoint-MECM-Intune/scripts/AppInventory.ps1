## This script creates an inventory of all applications installed from Intune on the device and saves the output in a CSV file.

## Connect to the Intune service (will feature a prompt for naming the tenant with credentials)
Connect-MSGraph -TenantId (Read-Host "Enter the Tenant ID to connect to") -Credential (Get-Credential)

## Get all the applications installed from Intune on the device
$IntuneApps = Get-IntuneManagedDeviceApp | Select-Object DeviceName, AppName, AppVersion, InstallState, LastSyncDateTime

## Save the output in a CSV file
$IntuneApps | Export-Csv -Path "C:\IntuneAppInventory.csv" -NoTypeInformation