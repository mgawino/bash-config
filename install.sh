curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
rsync -av --progress . ~/ --exclude .git --exclude install.sh
