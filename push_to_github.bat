@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
echo A|choco install gh --force

cd /D "%~dp0"
cd ..

FOR /F "delims=|" %%A IN ("%CD%") DO (
    SET SOMEFILE=%%~nxA
)

git init
git add .
touch .gitignore
git rm --cached batches

git config --global user.name "AUTOMATIC PUSHER"
git config --global user.email "automaticpusher@labcomputers"
git commit -m "init commit"

gh auth login -p https -w

cd ..
gh repo create --push --private
timeout 10000

:file_name_from_path <resultVar> <pathVar>
(
    set "%~1=%~nx2"
    exit /b
)