@echo off

cd /D "%~dp0"
cd ..


git init
git add .
touch .gitignore
git rm --cached batches

git config --global user.name "GITHUB SCRIPTS BY GIL"
git config --global user.email "githubscripts@gil"
git commit -m "init commit"&cls

gh auth login -p https -w

git remote rm origin
gh repo create --source=%CD% --private --push&cls
if %errorlevel% equ 0 (
  goto END
) else (
  goto ALTERNATIVEEND
)

:END
echo DONE!
pause
exit

:ALTERNATIVEEND
for %%f in ("%CD%") do set myfolder=%%~nxf
echo You already have a GitHub repo named %myfolder%. Please delete it/change your folder name.
pause
exit
