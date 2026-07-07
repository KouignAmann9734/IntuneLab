# Legacy Architecture: MECM + Active Directory

## Overview
This document describes the traditional on-premises endpoint management stack used by many enterprises.

## Components
- Active Directory Domain Services (AD DS)
- MECM (SCCM) Primary Site
- Distribution Points
- WSUS
- Group Policy Objects (GPO)
- On-prem file shares
- VPN-based remote access

## Diagram (ASCII)
[AD DS] ---- [MECM Primary Site] ---- [DPs]
   |             |                      |
[GPO]         [WSUS]                [Clients]

## Limitations
- Requires domain join
- Heavy infrastructure
- Slow remote management
- Complex patching