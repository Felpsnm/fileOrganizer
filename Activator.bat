@echo off
for /f %%a in ('wmic baseboard get /format:list ^| find /i "SerialNumber"') do (
	echo %%a>C:\Users\%username%\AppData\Local\BaseBoardSerial.txt
)