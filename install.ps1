# Vu Studio Installer Bootstrap
# This lightweight script handles admin elevation before downloading the main installer
# Usage: irm https://raw.githubusercontent.com/vustudio/vustudio-util-public/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

# Check if running as admin
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $isAdmin) {
    Write-Host "Vu Studio Installer requires administrator privileges. Restarting as admin..." -ForegroundColor Yellow
    
    # Create a temporary script that will download and run the main installer
    $tempScript = "$env:TEMP\vustudio_launcher.ps1"
    
    @'
# Download and run the main Vu Studio installer
$url = "https://raw.githubusercontent.com/vustudio/vustudio-util-public/main/vustudio.ps1"
Write-Host "Downloading Vu Studio Installer..." -ForegroundColor Green
try {
    $script = Invoke-WebRequest -Uri $url -UseBasicParsing | Select-Object -ExpandProperty Content
    Invoke-Expression $script
} catch {
    Write-Host "Error downloading installer: $_" -ForegroundColor Red
    Write-Host "Press any key to exit..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
'@ | Out-File -FilePath $tempScript -Encoding UTF8
    
    # Start PowerShell as admin
    Start-Process powershell.exe -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "`"$tempScript`"" -Verb RunAs
    exit
}

# If already admin, download and run directly
Write-Host "Downloading Vu Studio Installer..." -ForegroundColor Green
$mainScript = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/vustudio/vustudio-util-public/main/vustudio.ps1" -UseBasicParsing | Select-Object -ExpandProperty Content
Invoke-Expression $mainScript