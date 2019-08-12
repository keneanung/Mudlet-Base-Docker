# escape=`

FROM keneanung/qt-windows:5.12.3-mingw-x86

RUN powershell -Command New-Item -Path 'C:\src\Mudlet' -ItemType Directory
COPY Mudlet C:/src/Mudlet/
RUN setx PATH "%MINGW_BASE_DIR%\bin;C:\Python27;C:\Program Files (x86)\CMake\bin;C:\MinGW\bin;C:\MinGW\msys\1.0\bin;C:\Program Files\7-Zip;%PATH%"
RUN powershell -Command cd C:\src\Mudlet\CI; `
   [Net.ServicePointManager]::SecurityProtocol = [System.Security.Authentication.SslProtocols] 'tls, tls11, tls12'; `
   . .\appveyor.functions.ps1; `
   CheckAndInstall7z; `
   CheckAndInstallCmake; `
   CheckAndInstallMingwGet; `
   CheckAndInstallMsys; `
   CheckAndInstallBoost; `
   CheckAndInstallPython; `
   cd ..\..; `
   dir; `
   [IO.Directory]::Delete((Resolve-Path "C:\src").ProviderPath, $true)
