@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo 请求管理员权限...
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B

:gotAdmin
echo 修改或添加域名解析记录...

cd C:\Windows\System32\drivers\etc

set "domain=www.shireyishunjian.com"
set "ip=172.67.193.224"
set "hostsFile=hosts"

REM Check if the domain exists in the hosts file
findstr /C:"%domain%" "%hostsFile%" >nul

if %errorlevel% equ 0 (
    echo 域名已存在，正在更新解析记录...
    REM Update the existing domain's IP address
    (for /f "tokens=*" %%a in ('type "%hostsFile%" ^& break ^> "%hostsFile%"') do (
        echo %%a | findstr /C:"%domain%" >nul
        if %errorlevel% equ 0 (
            echo %ip% %domain%
        ) else (
            echo %%a
        )
    )) > "%hostsFile%.tmp"
    move /y "%hostsFile%.tmp" "%hostsFile%"
    echo 解析记录已更新。
) else (
    echo 域名不存在，正在添加解析记录...
    REM Append the new domain's IP address
    echo %ip% %domain% >> "%hostsFile%"
    echo 解析记录已添加。
)

pause
