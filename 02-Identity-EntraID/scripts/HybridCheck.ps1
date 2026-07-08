## This script checks if the device is managed by Configuration Manager (CCM) and if it is enrolled in Intune. The script will also check if the device is compliant with the organization's policies and if it is able 
## to communicate with the Configuration Manager server. Outputs everything in, you guessed it, a CSV file.

## Check if the device is managed by Configuration Manager (CCM)
$CCMStatus = Get-CimInstance -Namespace "root\ccm" -ClassName "SMS_Client" | Select-Object ClientState, ClientVersion, LastContactTime, SiteCode

## Check if the device is enrolled in Intune
$IntuneStatus = Get-IntuneManagedDevice | Select-Object DeviceName, DeviceType, ComplianceState, LastSyncDateTime

## Save the output in a CSV file
$CCMStatus | Export-Csv -Path "C:\HybridCheck_CCMStatus.csv" -NoTypeInformation
$IntuneStatus | Export-Csv -Path "C:\HybridCheck_IntuneStatus.csv" -NoTypeInformation

## Additional information about the Configuration Manager client and Intune enrollment can be added to the CSV files by modifying the Select-Object cmdlet to include other relevant attributes.