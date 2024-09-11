@REM (Re-)start hidden powershell script, which runs `zebar open bar --args ...` for every monitor.
@echo off
taskkill /im zebar.exe /f
timeout /t 1
@REM ping 127.0.0.1 -n 1 -w 500> nul
powershell -WindowStyle hidden -Command ^
  $monitors = zebar monitors; ^
  foreach ($monitor in $monitors) { Start-Process -WindowStyle Hidden -FilePath \"zebar\" -ArgumentList \"open bar --args $monitor\" };
