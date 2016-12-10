My Dotfiles
===========

Overview
--------

* [Window Manager](#window-manager) - [i3wm](http://i3wm.org/)
* [Editor](#editor) - Vim ([Vundle](https://github.com/gmarik/Vundle.vim) handles my vim plugins)
* Shell - Zsh ([Antigen](https://github.com/zsh-users/antigen) is awesome)
* Terminal:
  - ubuntu - [Terminator](http://en.wikipedia.org/wiki/Gnome_Terminator)
  - macosx - [iterm2 ]()

I use pretty much ~~everything~~ out of the box but I've made some customizations to enhance my workflow
which I'll try to explain in a bit ;).

---------------------
##### NOTE:

You should review any files you decide to include in your personal dotfiles.
I'll try as much as possible to explain them as comments in the corresponding
files. If there's any thing you need further explanation as to how it works
and/or what it does, please open an issue so we iron out the kinks. Thanks!

--------------------
Requirements
------------

- Set zsh as login shell:

      chsh -s $(which zsh)

- Vim compiled with python

Installation
------------

    git clone https://github.com/jeffgodwyll/dotfiles.git
    cd dotfiles
    ./install

Note, the `install` script can be run multiple times. It's safe :) Under the
hood, all it's really doing is symlinking the appropriate files into place using
`install.conf.yaml`.

Uses [dotbot](https://github.com/anishathalye/dotbot) ;)

Restart your shell for changes to take effect and to install and set up
antigen. Or just source your `.zshrc` file for the changes to kick in:

    source .zshrc

Also to install Vundle Bundles, run the command below:

    vim +BundleInstall +qall

Window Manager
--------------

#### i3bar

Nothing fancy and no hassle using conky here.
Just load [fontawesome](http://fortawesome.github.io/Font-Awesome/) and you're
good to go.

![my i3 bar](https://lh3.googleusercontent.com/-0edPkKmRY14/VCiom6ox_9I/AAAAAAAAGWM/wxlxBddAtNM/w1013-h15-no/my_i3bar.png "my i3 bar")

Editor
------

This is explained a bit more into detail at:
https://www.jeffgodwyll.com/posts/2016/dotfile-goodness-vim/

Again [Vundle](https://github.com/gmarik/Vundle.vim) handles my Vim plugins.

My Vim config is optimised to make working with the following easier:
- Python
- JavaScript
- CSS
- HTML
- Jinja
- TypeScript
- Markdown
- Java(sometimes)
- various configuration files


#### Python-specific plugins

- [jedi-vim][], awesome Python autocompletion with Vim
- [vim-jinja][], jinja support
- [vim-virtualenv][], for Python virtualenv support
- [python-mode][], static analysis, refactoring, folding, completion, documentation, etc
- [vim-flake8][], static syntax and style checker for Python


#### IDE-like Enhancements

- [vim-airline][], a better status line
- [fugitive][], for git integration
- [syntastic][], syntax checking for various file formats
- [vim-powerline][], status line utility for Vim
- [ctrlp][], for quick file opening
- [tagbar][], for improved code outlines / navigations
- [NERDTree][], for file navigation
- [GoldenView][], always have a nice view for Vim split windows
- [vim-json][], distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
- [MatchTagAlways][], always highlight tag pairs
- [vim-livedown][], for live preview of Markdown files
- [Goyo][], distraction-free writing
- [limelight][], hyperfocus-writing in Vim
- [emmet-vim][], html code completion
- [i3-vim-syntax][], syntax checking for i3 config


  [NERDTree]: https://github.com/scrooloose/nerdtree
  [numbers]: https://github.com/myusuf3/numbers.vim.git
  [ctrlp]: https://github.com/kien/ctrlp.vim.git
  [fugitive]: http://github.com/tpope/vim-fugitive.git
  [Goyo]: https://github.com/junegunn/goyo.vim
  [vimmarkdown]: https://github.com/tpope/vim-markdown
  [vim-livedown]: https://github.com/shime/vim-livedown
  [GoldenView]: https://github.com/zhaocai/GoldenView
  [syntastic]: https://github.com/scrooloose/syntastic
  [jedi-vim]: https://github.com/davidhalter/jedi-vimx
  [MatchTagAlways]: https://github.com/Valloric/MatchTagAlways
  [vim-json]: https://github.com/elzr/vim-json
  [vim-jinja2-syntax]: https://github.com/glench/vim-jinja2-syntax
  [vim-virtualenv]: https://github.com/jmcantrell/vim-virtualenv
  [python-mode]: https://github.com/klen/python-modei
  [vim-flake8]: https://github.com/nvie/vim-flake8
  [vim-airline]: https://github.com/bling/vim-airline
  [emmet-vim]: https://github.com/mattn/emmet-vim
  [i3-vim-syntax]: https://github.com/PotatoesMaster/i3-vim-syntax
  [limelight]: https://github.com/junegunn/limelight.vim
  [tagbar]: https://github.com/majutsushi/tagbar
  [vim-powerline]: https://github.com/Lokaltog/vim-powerline

Colours
-------

In Vim I use the [Mustang colour scheme][mustang]

My terminal uses a variant of [monokai][monokai], [spiderman][spiderman], [the hulk][the hulk] or [chalk][chalk] depending on my
mood :) and probably because they blend in nicely with my
[bullet train zsh theme][bt].

[bt]: https://github.com/caiogondim/bullet-train-oh-my-zsh-theme
[chalk]: https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/terminator/Chalk.config
[mustang]: http://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484
[monokai]: https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/terminator/DimmedMonokai.config
[spiderman]: https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Spiderman.itermcolors
[the hulk]: https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/The%20Hulk.itermcolors
