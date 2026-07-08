## This script is supposed to import an Active Directory group to EntraID and map the group membership to the corresponding users in EntraID. The script will also include the user's group membership and other relevant attributes.

## Connect to the remote Active Directory server (will feature a prompt for naming the server with credentials)
Connect-ADServer -Server (Read-Host "Enter the name of the Active Directory server to connect to") -Credential (Get-Credential)

## Import the Active Directory group to EntraID and map the group membership to the corresponding users in EntraID
$ADGroupName = Read-Host "Enter the name of the Active Directory group to import"
$ADGroup = Get-ADGroup -Identity $ADGroupName -Properties *

## Get the members of the Active Directory group
$ADGroupMembers = Get-ADGroupMember -Identity $ADGroupName

## Connect to the EntraID service (will feature a prompt for naming the tenant with credentials)
Connect-MSGraph -TenantId (Read-Host "Enter the Tenant ID to connect to")

## Import the Active Directory group to EntraID
$EntraIDGroup = New-MgGroup -DisplayName $ADGroup.Name -Mail

Nickname $ADGroup.SamAccountName -SecurityEnabled $true -MailEnabled $false -GroupTypes @("Unified")

## Map the group membership to the corresponding users in EntraID
foreach ($ADGroupMember in $ADGroupMembers) {
    $EntraIDUser = Get-MgUser -Filter "userPrincipalName eq '$($ADGroupMember.UserPrincipalName)'"
    if ($EntraIDUser) {
        Add-MgGroupMember -GroupId $EntraIDGroup.Id -DirectoryObjectId $EntraIDUser.Id
    }
}
