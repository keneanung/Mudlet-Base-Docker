# escape=`

FROM keneanung/qt-windows:5.12.2-mingw-x86

COPY Mudlet C:/src/Mudlet
RUN powershell -Command "cd C:\src\Mudlet\CI; `
   [Net.ServicePointManager]::SecurityProtocol = [System.Security.Authentication.SslProtocols] "tls, tls11, tls12"; `
   . .\appveyor.functions.ps1; `
   CheckAndInstall7z; `
   CheckAndInstallCmake; `
   CheckAndInstallMingwGet; `
   CheckAndInstallMsys; `
   CheckAndInstallBoost; `
   CheckAndInstallPython; `
   cd ..\..; `
   dir; `
   Remove-Item -Recurse -Force C:\src"