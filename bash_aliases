alias ul=ultralist
alias grevm="git review --message"
alias icat="kitty +kitten icat"
alias unshallow="git fetch --unshallow"
alias cdf='cd $(find * -type d | fzf)'
alias browsh='docker run --rm -it browsh/browsh'
alias alr_env='eval $(alr printenv)'
alias v='$EDITOR'
alias c=clear
alias say=spd-say
alias sync_configs='pull_configs.py && push_configs.py'
alias la='exa -l --git --header'
alias publickey='xclip -sel clip < ~/.ssh/id_rsa.pub'
alias view='exa --tree -l --git'
alias fd=fdfind
alias g=git
alias gwl='git worktree list'
alias gwr='git worktree remove'
alias mux=tmuxinator
alias gcd='cd $(git rev-parse --show-toplevel)'
alias gcdu='gcd; cd ..; gcd'
alias confvim='nvim ~/dotfiles/vimrc'
alias confbash='nvim ~/dotfiles/bash_aliases'
alias confgit='nvim ~/dotfiles/gitconfig'
alias conftmux='nvim ~/dotfiles/tmux.conf'
alias conftig='nvim ~/.tigrc'
alias tp=trash-put
alias clip='xclip -selection clipboard'
alias lg=lazygit
alias clipout='xclip -o -selection clipboard'
alias port_status='netstat -ant | grep '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias sup='sudo apt-get update'
alias sui='sudo apt-get install'
alias t='tree'
alias td='tree -L 2'
alias tdd='tree -L 3'
alias tddd='tree -L 4'
alias abook='( cd ~/.abook; git pull; abook; git commit -am "automatic commit"; git push origin master; )'
cscope() {
  git ls-files | sed 's_^\(.*\)$_\"\1\"_' > cscope.files
  ionice -c3 cscope -q -R -b -i cscope.files
}
alias tags='cscope && ionice -c3 ctags -R .'
alias m='make'
alias yavide="gvim --servername yavide -f -N -u /opt/yavide/.vimrc"
alias find='ionice -c3 find'
alias csa='scan-build make -f games.mak'
alias ff='ionice -c3 find . -type f'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

zc(){
  history -a
  check
  history -r
}

scriptit(){
  history -a
  script_from_history $@
}

findfilegrep(){
	ff | xargs -I{} grep -n -i "$1" "{}" /dev/null
}
findcppfilegrep(){
	ff -name "*.cpp" -or -name "*.h" | xargs -I{} grep -n -i "$1" "{}" /dev/null
}
sorti(){
  sort $1 > tmpsortingfile; mv tmpsortingfile $1;
}

findfilesed(){
  ff | xargs -I{} sed -i "$@" "{}"
}

alias ffsed=findfilesed
alias ffgrep=findfilegrep
alias findcpp=findcppfilegrep

# Compress images
alias im_10='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 10% {} {}'
alias im_20='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 20% {} {}'
alias im_30='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 30% {} {}'
alias im_40='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 40% {} {}'
alias im_50='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 50% {} {}'
alias im_60='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 60% {} {}'
alias im_70='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 70% {} {}'
alias im_80='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 80% {} {}'
alias im_90='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 90% {} {}'

alias mkcd='. mkcd'
alias tiga="tig --all"

# Docker

# Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'

# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

# Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'

testjson(){
    python -c "import json;file = open('$1');json.loads(file.read());file.close()"
}

# mkproj shortcuts https://github.com/TamaMcGlinn/mkproj
mkada() { mkproj project_templates/ada_gprbuild "$1"; cd "$1"; }
mkbada() { mkproj project_templates/ada_bazel "$1"; cd "$1"; }
mkcpp() { mkproj project_templates/cpp_makefile "$1"; cd "$1"; }
mkvim() { mkproj project_templates/vimplugin "$1"; mv "$1" "$1"; cd "$1"; }
