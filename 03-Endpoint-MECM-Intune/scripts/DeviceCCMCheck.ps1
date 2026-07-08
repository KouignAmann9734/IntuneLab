## This script checks if the device still has the Configuration Manager client installed and if it is still communicating with the Configuration Manager server. Output is saved in a CSV file.

## Contact the remote device (will feature a prompt for naming the device with credentials)

Connect-CimInstance -ComputerName (Read-Host "Enter the name of the device to check") -Credential (Get-Credential)

## Check if the Configuration Manager client is installed and communicating with the server

Get-CimInstance -Namespace "root\ccm" -ClassName "SMS_Client" | Select-Object ClientState, ClientVersion, LastContactTime, SiteCode | Format-Table -AutoSize

## Save the output in a CSV file

Get-CimInstance -Namespace "root\ccm" -ClassName "SMS_Client" | Select-Object ClientState, ClientVersion, LastContactTime, SiteCode | Export-Csv -Path "C:\DeviceCCMCheck.csv" -NoTypeInformation

## Additional information about the Configuration Manager client can be added to the CSV file by modifying the Select-Object cmdlet to include other relevant attributes.