# Target Architecture: Entra ID + Intune

## Overview
This document describes the modern cloud-based endpoint management stack.

## Components
- Entra ID (identity plane)
- Intune (device + app + compliance plane)
- Autopilot (provisioning)
- Conditional Access (security)
- Defender for Endpoint (protection)
- Windows Update for Business (patching)

## Diagram
[Entra ID] ---- [Intune] ---- [Autopilot]
    |              |             |
[Conditional Access]        [WUfB]

## Benefits
- No domain join required
- Cloud-native provisioning
- Zero-trust security
- Lightweight infrastructure
