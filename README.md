# Vu Studio Installer

A one-click installer for Vu Studio workstations that automates application installation and system configuration.

## Quick Install

**Run this command in an elevated PowerShell window:**

```powershell
irm https://raw.githubusercontent.com/vustudio/vustudio-util-public/main/vustudio.ps1 | iex
```

**Or for automatic admin elevation:**

```powershell
irm https://raw.githubusercontent.com/vustudio/vustudio-util-public/main/install.ps1 | iex
```

## What It Installs

### Applications by Category

- **Browsers**: Google Chrome
- **Development**: VS Code, Git, Node.js, Docker, Python, Postman
- **Media**: VLC, OBS Studio, FFmpeg, Audacity
- **Vu Studio**: Unity Hub, Blender, NDI Tools
- **Utilities**: 7-Zip, PowerToys, Notepad++, TeamViewer
- **Communication**: Slack, Zoom

### System Configuration

- Disables sleep mode for 24/7 operation
- Enables high performance power plan
- Configures Windows Firewall for Vu Studio ports:
  - **Vu Studio HTTP**: 8080-8082
  - **Unity Collaboration**: 44000-44100
  - **NDI Video**: 5960-5961
  - **Vu One Application**: 52857 (WebSocket), 52859 (HTTP)
- Optimizes Windows for video production
- Enables Remote Desktop
- Configures auto-login

## Requirements

- Windows 10/11 (Pro or Enterprise recommended)
- Administrator privileges
- Internet connection
- Windows Package Manager (winget)

## Features

- 🚀 **One-Click Installation** - Install all applications at once
- ⚙️ **System Optimization** - Configured for video production workflows
- 🔥 **Firewall Management** - Automatic port configuration
- 📊 **System Information** - Real-time status monitoring
- 🎨 **Modern UI** - Clean, dark-themed interface

## Troubleshooting

### Common Issues

1. **"Winget not found"**
   - Install App Installer from Microsoft Store
   - Or download from: https://github.com/microsoft/winget-cli

2. **"Access Denied"**
   - Right-click PowerShell and "Run as Administrator"

3. **Installation fails**
   - Check internet connection
   - Verify Windows version compatibility

### Manual Download

If the one-liner doesn't work, you can download and run manually:

1. Download [vustudio.ps1](https://raw.githubusercontent.com/vustudio/vustudio-util-public/main/vustudio.ps1)
2. Right-click PowerShell → "Run as Administrator"
3. Navigate to download folder and run: `.\vustudio.ps1`

## Support

For issues or questions, contact Vu Studio support.

---

**Note**: This installer modifies system settings for optimal video production performance. Always test in a non-production environment first.