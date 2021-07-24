function gen_completions()
{
  COMPREPLY=($(ls -d ~/.config/mkproj/*/*/ | (while read line; do START_REMOVED=${line#/*/*/*/*/}; echo ${START_REMOVED%/}; done) | grep "${COMP_WORDS[${COMP_CWORD}]}"))
}
complete -F gen_completions mkproj
