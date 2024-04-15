taskkill /f /im python.exe
taskkill /f /im komorebi.exe
komorebic start --whkd
Start-Process "C:\Github\yasb\src\main.py" -WindowStyle hidden 
