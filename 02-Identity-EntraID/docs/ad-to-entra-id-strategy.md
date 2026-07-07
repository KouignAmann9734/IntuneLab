# AD to Entra ID Migration Strategy

## Identity States
- Hybrid Join
- Cloud-only
- Federated (legacy)
- Password Hash Sync

## Migration Steps
1. Inventory AD users
2. Normalize attributes (UPN, mail, proxyAddresses)
3. Map AD groups to Entra ID roles
4. Plan Conditional Access baseline
5. Move workloads gradually

## Example Mapping Table
| AD Group | Entra ID Group | Purpose |
|---------|----------------|---------|
| HR-Users | HR-Cloud-Users | App assignment |
| IT-Admins | Intune-Admins | RBAC |
