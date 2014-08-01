if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

source $HOME/antigen.zsh

antigen use oh-my-zsh

# Bundles
antigen bundle git
antigen bundle github

antigen bundle python 
antigen bundle virtualenv 
antigen bundle virtualenvwrapper
antigen bundle pip

antigen bundle npm
antigen bundle node

antigen bundle heroku
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting


# Theme
antigen theme rixius

antigen apply


# Messy path
export PATH="~/gradle-1.11/bin:/usr/local/heroku/bin:{PATH}:/home/jeff/adt-bundle-linux-x86_64-20140321/sdk/platform-tools:/home/jeff/adt-bundle-linux-x86_64-20140321/sdk/tools:/usr/bin:/bin:/usr/local/bin:/usr/lib/jvm/java-7-openjdk-amd64:/algs4/bin"
### Add -/algs4/bin to the PATH
export PATH=$PATH:$HOME/algs4/bin

# Aliases
alias ranger='~/Downloads/ranger-1.6.1/ranger.py'
alias chrome=google-chrome-unstable
alias settings=gnome-control-center
alias vga='xrandr --output VGA1 --auto --right-of LVDS1'
alias hdmi='xrandr --output HDMI1 --auto --right-of LVDS1'
alias suspend='sudo pm-suspend'
alias lock='i3lock -c #1E90FF'