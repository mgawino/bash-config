curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
rsync -av --progress . ~/ --exclude .git --exclude install.sh
