@echo off

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "HelmetCondensed Normal (TrueType)" /t REG_SZ /d "c:\windows\fonts\HelmetCondensed.ttf"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Arial (TrueType)" /t REG_SZ /d "c:\windows\fonts\arial.ttf"

C:\ServiceMonitor.exe w3svc