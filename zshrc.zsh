check_env() {
    eval zzz='$'$1
    if [ -z "$zzz" ]; then
        echo "Error! Please set ENV \"$1\"!"
    fi
}

############################
# For General Setting
############################
alias tree="tree -C"
set -o vi

# YouCompleteMe
export PYTHON_CONFIGURE_OPTS="--enable-shared"


############################
# For antigen zsh
############################
# curl -L git.io/antigen > ~/.antigen.zsh
source ~/.antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle Tarrasch/zsh-autoenv

# https://github.com/agnoster/agnoster-zsh-theme
# git clone https://github.com/powerline/fonts.git --depth=1 && fonts/install.sh && rm -rf fonts
# sudo apt-get install fonts-powerline
antigen theme agnoster

antigen apply


# Hide user@host in prompt
# export DEFAULT_USER='xxx'
prompt_context(){}

prompt_dir() {
    prompt_segment blue black "%$(( $COLUMNS - 33 ))<...<%~%<<"
    # prompt_segment blue black '%2~'  # limit 2 last 2 dirs
}

prompt_end0() {
  if [[ -n $CURRENT_BG ]]; then
      print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
      print -n "%{%k%}"
  fi

  print -n "%{%f%}"
  CURRENT_BG='' 

  #Adds the new line and ➜ as the start character.
  printf "\n ➜";
}

unsetopt share_history
