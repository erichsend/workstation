if [ ! -d "/home/dave/repo/dotfiles" ]; then
	mkdir -p "/home/dave/repo/"
	git clone --recurse-submodules https://github.com/erichsend/dotfiles.git "/home/dave/repo/dotfiles"
fi

ln -s "/home/dave/repo/dotfiles/zsh/zshrc" "/home/dave/.zshrc"
ln -s "/home/dave/repo/dotfiles/zsh/p10k.zsh" "/home/dave/.p10k.zsh"

mkdir -p /home/dave/.config

git clone https://github.com/ohmyzsh/ohmyzsh.git /home/dave/.config/oh-my-zsh
rm -r "/home/dave/.config/oh-my-zsh/custom"
ln -s "/home/dave/repo/dotfiles/zsh/oh-my-zsh/custom/" "/home/dave/.config/oh-my-zsh/custom"

ln -s "/home/dave/repo/dotfiles/jimux/" "/home/dave/.config/jimux"
ln -s "/home/dave/repo/dotfiles/k9s/" "/home/dave/.config/k9s"
ln -s "/home/dave/repo/dotfiles/nvim/" "/home/dave/.config/nvim"
ln -s "/home/dave/repo/dotfiles/tmux/" "/home/dave/.config/tmux"
ln -s "/home/dave/repo/dotfiles/tmuxp/" "/home/dave/.config/tmuxp"
