## This script is going to export all the users from Active Directory and save them in a CSV file. The script will also include the user's group membership and other relevant attributes. 

## Contact remote Active Directory server (will feature a prompt for naming the server with credentials)

Connect-ADServer -Server (Read-Host "Enter the name of the Active Directory server to connect to") -Credential (Get-Credential)

## Export all users from Active Directory to a CSV file

Get-ADUser -Filter * -Properties * | Select-Object Name, SamAccountName, UserPrincipalName, Enabled, LastLogonDate, MemberOf | Export-Csv -Path "C:\ADUsersExport.csv" -NoTypeInformation

## Additional information about the users can be added to the CSV file by modifying the Select-Object cmdlet to include other relevant attributes.