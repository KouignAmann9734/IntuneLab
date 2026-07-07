# Autopilot Concept

## What Autopilot Does
- Pre-register device
- Assign profile
- Configure OOBE
- Enroll into Intune automatically

## Autopilot Flow
1. Device boots
2. Contacts Microsoft
3. Downloads profile
4. Enrolls into Intune
5. Applies policies and apps

## Example Profile (pseudo)
{
  "deploymentMode": "UserDriven",
  "joinType": "AzureADJoin",
  "language": "fr-FR"
}
