if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

export TERM='xterm-256color'
export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=960x540

source $HOME/antigen.zsh

antigen use oh-my-zsh

# Bundles
antigen bundle git
antigen bundle github

antigen bundle python
antigen bundle virtualenv
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


# For theme: override virtualenv display config
BULLETTRAIN_VIRTUALENV_PREFIX='⚡'

case `uname` in
    Darwin)
        export PATH=/usr/local/bin:/usr/local/sbin:$PATH
        ;;
    Linux)
        # Android SDK
        export ANDROID_HOME=/home/jeff/android-sdk/sdk

        # Paths
        export PATH="~/android-sdk/sdk/platform-tools:~/android-sdk/sdk/tools:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/sbin:/usr/lib/jvm/java-7-openjdk-amd64"

        # Python path
        # export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

        # Games
        export PATH=$PATH:/usr/games

        # Linux brew, new package manager
        export PATH="$HOME/.linuxbrew/bin:$PATH"
        export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
        export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

        # autoenv
        if [ -f ~/.linuxbrew/opt/autoenv/activate.sh ]; then
            source ~/.linuxbrew/opt/autoenv/activate.sh
        fi

        # Android Studio
        export PATH="$HOME/android-studio/bin:$PATH"

        # java8 home
        export JAVA8_HOME=/usr/lib/jvm/java-8-openjdk-amd64

        # Go App Engine Path
        # export PATH=$PATH:$HOME/go_appengine/
        # # Go path
        # export PATH=$PATH:~/.linuxbrew/opt/go/libexec/bin
        # export GOPATH="$HOME/.linuxbrew/opt/go/bin"

        # Packer for vagrant path
        # export PATH=$PATH:$HOME/packer/

        # Dart path
        # export PATH=$PATH:/usr/lib/dart/bin

        ### Added by the Heroku Toolbelt
        # export PATH="/usr/local/heroku/bin:$PATH"
        ;;
esac


# Google App Engine, dev_appserver and appcfg  PATH
# TODO: Stop using this in the future after learning to properly use the newer
# gcloud tool
if [ -d ~/google_appengine ]; then
    export PATH=$PATH:$HOME/google_appengine/
fi

# git-flow-completion
# install git-flow with apt-get
# http://jeffkreeftmeijer.com/2010/why-arent-you-using-git-flow/
# http://nvie.com/posts/a-successful-git-branching-model/
source $HOME/git-flow-completion.zsh

# Aliases
alias aria='aria2c --file-allocation=none -c -x 10'
alias aria_list='aria2c --file-allocation=none --force-sequential=true -c -x 10 -i'
alias chrome=google-chrome-unstable
alias hdmi='xrandr --output HDMI1 --auto --right-of LVDS1'
alias lock='i3lock -c #1e90ff'
alias ranger='~/downloads/ranger-1.6.1/ranger.py'
alias reload_sound='pulseaudio -k && sudo alsa force-reload'
alias route_sound='pactl load-module module-loopback'
alias settings=gnome-control-center
alias unroute_sound='pactl unload-module module-loopback'
alias utorrent='utserver -settingspath /opt/utorrent-server-alpha-v3_3/ &'
alias vga='xrandr --output VGA1 --auto --right-of LVDS1'
alias vga_same='xrandr --output VGA1 --auto --same-as LVDS1'
alias server='python -m SimpleHTTPServer'

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/jeff/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f ~/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/jeff/google-cloud-sdk/completion.zsh.inc'
fi
