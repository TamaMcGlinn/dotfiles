alias c=clear
alias view='tree -Ld 2'
alias g=git
alias emp_make='make -f games.mak -j`nproc`'
alias emp_play='GAME_DEBUGGER=cgdb ./hl2.sh -game empires -steam -condebug -nobreakpad -insecure'
alias emp_serv='./srcds_run -game empires +map bottest2v9t +maxplayers 8 -nobreakpad -debug +ip 192.168.1.101'
alias emp_src='cd ~/code/empires/empires_base/mp/src'
alias emp_ga='cd ~/code/empires/empires_base/mp/game'
alias emp_scr='cd ~/code/empires/empires_base/mp/game/empires/scripts'
alias rm='echo "You should use trash-put. If you really want to permanently delete, use \\rm"; false'
alias steam='reallysteam'
alias mux=tmuxinator
alias confvim='nvim ~/dotfiles/vimrc'
alias confbash='nvim ~/dotfiles/bash_aliases'
alias confgit='nvim ~/dotfiles/gitconfig'
alias conftmux='nvim ~/dotfiles/tmux.conf'
alias tp=trash-put
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'
alias ...........='cd ../../../../../../../../../..'
alias ............='cd ../../../../../../../../../../..'
alias .............='cd ../../../../../../../../../../../..'
alias sup='sudo apt-get update'
alias sui='sudo apt-get install'
alias t='tree'
alias td='tree -L 2'
alias tdd='tree -L 3'
alias tddd='tree -L 4'
alias tags='ionice -c3 cscope -R -b && ionice -c3 ctags -R .'
alias m='make'
alias yavide="gvim --servername yavide -f -N -u /opt/yavide/.vimrc"
alias find='ionice -c3 find'
alias csa='scan-build make -f games.mak'
alias ff='ionice -c3 find . -type f'
findfilegrep(){
	ff | xargs -I{} grep -n -i "$1" "{}" /dev/null
}
findcppfilegrep(){
	ff -name "*.cpp" -or -name "*.h" | xargs -I{} grep -n -i "$1" "{}" /dev/null
}
alias ffgrep=findfilegrep
alias ffcppgrep=findcppfilegrep
alias mksmall='find . -name "*.JPG" -or -name "*.jpg" -exec convert -resize 900x -quality 45% {} {} \;'

# Empires console power usage
alias emp_logs='tail -f ~/.steam/steam/steamapps/common/Empires/empires/console.log'
alias emp_dev_logs='tail -f ~/code/empires/empires_base/mp/game/empires/console.log'
alias emp_grepchat='grep ".*([^)]*)\ [^:]*:\ .*" --color=never'
alias emp_chat='emp_chat -i "([^)]*)\ [^:]*:\ \(Tama\|Bob\)" | tee ~/code/empires/stuff/ingamechatlog.txt'
alias ifconfig='/sbin/ifconfig'
alias botserver='./srcds_run -game empires +map bottest2v9t +maxplayers 8 -nobreakpad -debug +sv_lan 0 +ip 192.168.1.101 -insecure'
alias unreal='~/code/UnrealEngine/Engine/Binaries/Linux/UE4Editor'
