﻿$ErrorActionPreference ='Stop'
$null = New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "HelmetCondensed Normal (TrueType)" -PropertyType String -Value "c:\windows\fonts\HelmetCondensed.ttf"

# Entry point here
Start-Process -FilePath "C:\ServiceMonitor.exe" -ArgumentList "w3svc"