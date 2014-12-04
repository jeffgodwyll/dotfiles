if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

export TERM='xterm-256color'

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
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train 


antigen apply

# Paths
# Messy path
export PATH="~/gradle-1.11/bin:/usr/local/heroku/bin:{PATH}:/home/jeff/adt-bundle-linux-x86_64-20140321/sdk/platform-tools:/home/jeff/adt-bundle-linux-x86_64-20140321/sdk/tools:/usr/bin:/bin:/usr/local/bin:/usr/lib/jvm/java-7-openjdk-amd64:/algs4/bin"

### Add -/algs4/bin to the PATH
export PATH=$PATH:$HOME/algs4/bin

# Google Cloud SDK
export PATH=$PATH:$HOME/Downloads/google_appengine

# The next line updates PATH for the Google Cloud SDK.
source '/home/jeff/google-cloud-sdk/path.zsh.inc'

# The next line enables bash completion for gcloud.
source '/home/jeff/google-cloud-sdk/completion.zsh.inc'

# Python path
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

# git-flow-completion
# install git-flow with apt-get
# http://jeffkreeftmeijer.com/2010/why-arent-you-using-git-flow/
# http://nvie.com/posts/a-successful-git-branching-model/
source $HOME/git-flow-completion.zsh

# Aliases
alias ranger='~/Downloads/ranger-1.6.1/ranger.py'
alias chrome=google-chrome-unstable
alias settings=gnome-control-center
alias vga='xrandr --output VGA1 --auto --right-of LVDS1'
alias vga_same='xrandr --output VGA1 --auto --same-as LVDS1'
alias hdmi='xrandr --output HDMI1 --auto --right-of LVDS1'
alias suspend='sudo pm-suspend'
alias lock='i3lock -c #1E90FF'
alias reload_sound='pulseaudio -k && sudo alsa force-reload'
