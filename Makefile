deps:
	sudo apt-get install tig tmux

install:
	ln -s ~/dotfiles/bash_aliases ~/.bash_aliases
	ln -s ~/dotfiles/bashrc ~/.bashrc
	ln -s ~/dotfiles/gitconfig ~/.gitconfig
	ln -s ~/dotfiles/tigrc ~/.tigrc
	ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
	ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim

uninstall:
	rm ~/.bash_aliases
	rm ~/.bashrc
	rm ~/.gitconfig
	rm ~/.tigrc
	rm ~/.tmux.conf
	rm ~/.config/nvim/init.vim
