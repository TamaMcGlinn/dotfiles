alias ul=ultralist
alias grevm="python3 ~/code/git-review/git_review/cmd.py --message"
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
alias im_1='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 1% {} {}'
alias im_2='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 2% {} {}'
alias im_3='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 3% {} {}'
alias im_4='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 4% {} {}'
alias im_5='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 5% {} {}'
alias im_6='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 6% {} {}'
alias im_7='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 7% {} {}'
alias im_8='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 8% {} {}'
alias im_9='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 9% {} {}'
alias im_10='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 10% {} {}'
alias im_11='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 11% {} {}'
alias im_12='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 12% {} {}'
alias im_13='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 13% {} {}'
alias im_14='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 14% {} {}'
alias im_15='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 15% {} {}'
alias im_16='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 16% {} {}'
alias im_17='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 17% {} {}'
alias im_18='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 18% {} {}'
alias im_19='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 19% {} {}'
alias im_20='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 20% {} {}'
alias im_21='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 21% {} {}'
alias im_22='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 22% {} {}'
alias im_23='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 23% {} {}'
alias im_24='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 24% {} {}'
alias im_25='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 25% {} {}'
alias im_26='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 26% {} {}'
alias im_27='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 27% {} {}'
alias im_28='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 28% {} {}'
alias im_29='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 29% {} {}'
alias im_30='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 30% {} {}'
alias im_31='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 31% {} {}'
alias im_32='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 32% {} {}'
alias im_33='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 33% {} {}'
alias im_34='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 34% {} {}'
alias im_35='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 35% {} {}'
alias im_36='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 36% {} {}'
alias im_37='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 37% {} {}'
alias im_38='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 38% {} {}'
alias im_39='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 39% {} {}'
alias im_40='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 40% {} {}'
alias im_41='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 41% {} {}'
alias im_42='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 42% {} {}'
alias im_43='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 43% {} {}'
alias im_44='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 44% {} {}'
alias im_45='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 45% {} {}'
alias im_46='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 46% {} {}'
alias im_47='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 47% {} {}'
alias im_48='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 48% {} {}'
alias im_49='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 49% {} {}'
alias im_50='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 50% {} {}'
alias im_51='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 51% {} {}'
alias im_52='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 52% {} {}'
alias im_53='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 53% {} {}'
alias im_54='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 54% {} {}'
alias im_55='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 55% {} {}'
alias im_56='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 56% {} {}'
alias im_57='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 57% {} {}'
alias im_58='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 58% {} {}'
alias im_59='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 59% {} {}'
alias im_60='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 60% {} {}'
alias im_61='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 61% {} {}'
alias im_62='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 62% {} {}'
alias im_63='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 63% {} {}'
alias im_64='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 64% {} {}'
alias im_65='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 65% {} {}'
alias im_66='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 66% {} {}'
alias im_67='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 67% {} {}'
alias im_68='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 68% {} {}'
alias im_69='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 69% {} {}'
alias im_70='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 70% {} {}'
alias im_71='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 71% {} {}'
alias im_72='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 72% {} {}'
alias im_73='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 73% {} {}'
alias im_74='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 74% {} {}'
alias im_75='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 75% {} {}'
alias im_76='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 76% {} {}'
alias im_77='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 77% {} {}'
alias im_78='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 78% {} {}'
alias im_79='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 79% {} {}'
alias im_80='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 80% {} {}'
alias im_81='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 81% {} {}'
alias im_82='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 82% {} {}'
alias im_83='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 83% {} {}'
alias im_84='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 84% {} {}'
alias im_85='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 85% {} {}'
alias im_86='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 86% {} {}'
alias im_87='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 87% {} {}'
alias im_88='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 88% {} {}'
alias im_89='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 89% {} {}'
alias im_90='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 90% {} {}'
alias im_91='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 91% {} {}'
alias im_92='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 92% {} {}'
alias im_93='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 93% {} {}'
alias im_94='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 94% {} {}'
alias im_95='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 95% {} {}'
alias im_96='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 96% {} {}'
alias im_97='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 97% {} {}'
alias im_98='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 98% {} {}'
alias im_99='find . -name "*.JPG" -or -name "*.jpg" | xargs -I{} convert -quality 99% {} {}'

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
mkvim() { mkproj project_templates/vimplugin "$1"; mv "$1" "vim-$1"; cd "vim-$1"; }
