## This script is going to map all the Active Directory groups to their corresponding EntraID groups. The script will also include the group's membership and other relevant attributes.

## Connect to the EntraID service (will feature a prompt for naming the tenant with credentials)
Connect-MSGraph -TenantId (Read-Host "Enter the Tenant ID to connect to")

## Get all the groups in EntraID and their membership
$EntraIDGroups = Get-MgGroup -All | Select-Object Id, DisplayName, Description, GroupTypes, SecurityEnabled, Visibility, Members

## Connect Active Directory (will feature a prompt for naming the domain with credentials)
Connect-AD -Server (Read-Host "Enter the name of the Active Directory domain to connect to") -Credential (Get-Credential)

## Get all the groups in Active Directory and their membership
$ADGroups = Get-ADGroup -Filter * -Properties Name, Description, GroupScope

## Map the Active Directory groups to their corresponding EntraID groups based on the group's name and other relevant attributes

foreach ($ADGroup in $ADGroups) {
    $MatchingEntraIDGroup = $EntraIDGroups | Where-Object { $_.DisplayName -eq $ADGroup.Name }
    if ($MatchingEntraIDGroup) {
        $Mapping = [PSCustomObject]@{
            ADGroupName = $ADGroup.Name
            ADGroupDescription = $ADGroup.Description
            ADGroupScope = $ADGroup.GroupScope
            EntraIDGroupName = $MatchingEntraIDGroup.DisplayName
            EntraIDGroupDescription = $MatchingEntraIDGroup.Description
            EntraIDGroupTypes = $MatchingEntraIDGroup.GroupTypes
            EntraIDSecurityEnabled = $MatchingEntraIDGroup.SecurityEnabled
            EntraIDVisibility = $MatchingEntraIDGroup.Visibility
        }
        $Mapping | Export-Csv -Path "C:\ADtoEntraIDMapping.csv" -Append -NoTypeInformation
    }
}

## Additional information about the groups can be added to the CSV file by modifying the Select-Object cmdlet to include other relevant attributes.