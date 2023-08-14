::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFEoGG1fbAES0A5EO4f7+r6fHp1QVXOoD/k43U0lMHPMQ+EDzcYQkwH9I1sIPA3s=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdFy5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAjk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQK1zfbSjssG5IE832qbCyV+PwUCdYiYsTWwpGfs07qKL/cAZZkNFQ==
::eg0/rx1wNQPfEVWB+kM9LVsJDDCNM2epZg==
::fBEirQZwNQPfEVWB+kM9LVsJDIFn0e14yaIV5m8SB7vJ8gNNGrJf
::cRolqwZ3JBvQF1fEqQK12Nfcg9AK45I+3n+ZOAd+OC8CR5qYuy27o0pTFH0IyBGXMYlgrXuqIrLcWgSJwevcpvgtt9CzSqPHR6YK6yb8
::dhA7uBVwLU+EWNFSEcXq7567g4Nq7exA4jDYL283J2J8ScjCimTvvwgBAjFe/2jQLsMTtR/UJv+/VE7j1Hs=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEcZ3ursuTycp/uaVHZg==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFEoGG1fbAES0A5EO4f7+r6fHp1QVXOoD/k43U0lMHGX2B8MmuhL1PPyDR0zvwZ6IkZd8q4rRfuGeXlOMOcOTpBzeGRoGOqJ+Hn1x5w==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO OFF
REM  QBFC Project Options Begin
REM  HasVersionInfo: No
REM Companyname: 
REM Productname: 
REM Filedescription: 
REM Copyrights: 
REM Trademarks: 
REM Originalname: 
REM Comments: 
REM Productversion:  0. 0. 0. 0
REM Fileversion:  0. 0. 0. 0
REM Internalname: 
REM ExeType: console
REM Architecture: x64
REM Appicon: 
REM AdministratorManifest: No
REM  QBFC Project Options End
@ECHO ON
@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo 正在请求管理员权限...
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin

echo 正在修改hosts文件...
cd C:\Windows\System32\drivers\etc
echo  cd C:\Windows\System32\drivers\etc
echo  172.67.193.224 www.shireyishunjian.com>>hosts
