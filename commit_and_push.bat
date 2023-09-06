@echo off

cd /D "%~dp0"
cd ..


git add .
touch .gitignore
git rm --cached batches

git config --global user.name "LAB"
git config --global user.email "COMPUTER@LAB"
git commit -m "%date%"&cls

git push origin main&cls
if %errorlevel% equ 0 (
  goto END
) else (
  goto MASTER
)

:MASTER
git push origin master&cls
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
echo Couldn't push to remote repo.
pause
exit
