install:
	ln -fs ~/dotfiles/bash_aliases ~/.bash_aliases
	ln -fs ~/dotfiles/bashrc ~/.bashrc
	ln -fs ~/dotfiles/gitconfig ~/.gitconfig
	ln -fs ~/dotfiles/tigrc ~/.tigrc
	ln -fs ~/dotfiles/tmux.conf ~/.tmux.conf
	ln -fs ~/dotfiles/muttrc/muttrc.muttrc ~/.muttrc

uninstall:
	rm ~/.bash_aliases
	rm ~/.bashrc
	rm ~/.gitconfig
	rm ~/.tigrc
	rm ~/.tmux.conf
	rm ~/.config/nvim/init.vim
	rm ~/.muttrc
