cd /D "%~dp0"
cd ..


git init
git add .
touch .gitignore
git rm --cached batches

git config --global user.name "AUTOMATIC PUSHER"
git config --global user.email "automaticpusher@labcomputers"
git commit -m "init commit"

gh auth login -p https -w

gh repo create --source=%CD% --private --push
timeout 10000
