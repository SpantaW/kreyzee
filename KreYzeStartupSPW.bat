@echo off
:: Check if the script is running as administrator
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo This script requires administrator privileges.
    echo Attempting to run as administrator...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb runAs"
    exit /b
)

echo Running as administrator.

cd %~dp0
@echo off
setlocal enabledelayedexpansion

set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
set "generatedSerial="

for /l %%A in (1,1,15) do (
    set /a randIndex=!random! %% 36
    set "char=!chars:~!randIndex!,1!"
    set "generatedSerial=!generatedSerial!!char!"
)


cd /d "C:\Windows\Globalization\Time Zone"

AMIDEWINx64.EXE /SU auto
cls
AMIDEWINx64.EXE /BS %random%%random%%random%
cls
AMIDEWINx64.EXE /CS %random%%random%%random%
cls
AMIDEWINx64.EXE /SS "To Be Filled By O.E.M"
cls
AMIDEWINx64.EXE /SK "To Be Filled By O.E.M"
cls
AMIDEWINx64.EXE /SF "To Be Filled By O.E.M"
cls
AMIDEWINx64.EXE /BT "To Be Filled By O.E.M"
cls
AMIDEWINx64.EXE /BLC "To Be Filled By O.E.M"
cls
AMIDEWINx64.EXE /CM "To Be Filled By O.E.M"
cls
AMIDEWINx64.EXE /CV "To Be Filled By O.E.M"
cls
AMIDEWINx64.EXE /CA "To Be Filled By O.E.M"
cls
AMIDEWINx64.EXE /CSK "SKU"
cls
AMIDEWINx64.EXE /PSN %random%%random%%random%
cls
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
