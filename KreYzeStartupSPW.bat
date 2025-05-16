@echo off
:: Check if the script is running as administrator
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo This script requires administrator privileges.
    echo Attempting to run as administrator...
    :: Relaunch the script as administrator
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb runAs"
    exit /b
)
:: The script continues here if running as admin
echo Running as administrator.

cd %~dp0
@echo off
setlocal enabledelayedexpansion

rem Set the working directory
cd /d "C:\Windows\Globalization\Time Zone"

rem Run AMIDEWINx64.EXE with various commands
AMIDEWINx64.EXE /SU auto
cls
AMIDEWINx64.EXE /BS %lastGeneratedSerials%
cls
AMIDEWINx64.EXE /CS %lastGeneratedSerials%
cls
AMIDEWINx64.EXE /SS %lastGeneratedSerials%
cls
AMIDEWINx64.EXE /SK "Default string"
cls
AMIDEWINx64.EXE /SF "Default string"
cls
AMIDEWINx64.EXE /BT "Default string"
cls
AMIDEWINx64.EXE /BLC "Default string"
cls
AMIDEWINx64.EXE /CM "Default string"
cls
AMIDEWINx64.EXE /CV "Default string"
cls
AMIDEWINx64.EXE /CA "Default string"
cls
AMIDEWINx64.EXE /CSK "SKU"
cls
AMIDEWINx64.EXE /PSN %lastGeneratedSerials%
cls

rem Keep specified values
AMIDEWINx64.EXE /BM "American Megatrends Inc."
cls
AMIDEWINx64.EXE /BV "1.0"
cls
AMIDEWINx64.EXE /SM "American Megatrends Inc."
cls

netsh winsock reset
cls
netsh winsock reset catalog
cls
netsh int ip reset
cls
netsh advfirewall reset
cls
netsh int reset all
cls
netsh int ipv4 reset
cls
netsh int ipv6 reset
cls

ipconfig /release
cls
ipconfig /flushdns
cls
ipconfig /renew
cls
ipconfig /flushdns
cls

WMIC PATH WIN32_NETWORKADAPTER WHERE PHYSICALADAPTER=TRUE CALL DISABLE
cls
WMIC PATH WIN32_NETWORKADAPTER WHERE PHYSICALADAPTER=TRUE CALL ENABLE
cls

arp -d

net stop winmgmt /y
net start winmgmt

endlocal

exit
