## This script list the devices enrolled in Intune, checks if their are 100% compliant with the policies, and if not, it will list the non-compliant devices and their compliance status. The output is saved in a CSV file.

## Connect to the Intune service (will feature a prompt for naming the tenant with credentials)
Connect-MSGraph -TenantId (Read-Host "Enter the Tenant ID to connect to") -Credential (Get-Credential)

## Get all the devices enrolled in Intune and their compliance status
$IntuneDevices = Get-IntuneManagedDevice | Select-Object DeviceName, DeviceType, ComplianceState, LastSyncDateTime

## Filter the non-compliant devices and save the output in a CSV file
$NonCompliantDevices = $IntuneDevices | Where-Object { $_.ComplianceState -ne "compliant" }
$NonCompliantDevices | Export-Csv -Path "C:\IntuneNonCompliantDevices.csv" -NoTypeInformation

