@echo off
set VMNAME="CapRover on Ubuntu 20.04"
powershell.exe -ExecutionPolicy Bypass -Command "Start-VM \"%VMNAME%"\""
