#!/bin/bash

if [ ! -x "$(command -v node)" ]; then
	curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&
		apt-get install -y nodejs
fi

# fzf -- completions added in zsh customization -- works manually.
if [ ! -d "/opt/fzf" ]; then
	git clone https://github.com/junegunn/fzf /opt/fzf
	pushd /opt/fzf
	./install --key-bindings --completion --no-update-rc --no-bash --no-fish
	ln -s /opt/fzf/bin/fzf /usr/local/bin/fzf
	popd
fi

# 1password
if [ ! -x "$(command -v op)" ]; then
	curl -sS https://downloads.1password.com/linux/keys/1password.asc |
		gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
		tee /etc/apt/sources.list.d/1password.list
	mkdir -p /etc/debsig/policies/AC2D62742012EA22/
	curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol |
		tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
	mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
	curl -sS https://downloads.1password.com/linux/keys/1password.asc |
		gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
	apt update && apt install 1password-cli
fi

sudo snap install nvim --classic
# sudo snap install go --classic ## Should download and install on user to make GOPATH more portable
# sudo snap install k9s          ## Doesn't work on hetzner
# sudo snap install lazygit      ## Installs but doesn't seem to start on hetzner
