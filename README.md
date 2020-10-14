Thanks to @natsammons for the original idea for the Mac. 

# Config `zsh` dotfiles

## Config Files
* [`.zshrc`](zshrc)
* [`.vimrc`](vimrc)
* [`global.gitignore`](global.gitignore)

# Installation and Setup

## 1. Clone This Repo To Your Home Directory

```bash
git clone https://github.com/henel321/linuxdotfiles.git ~/.linuxdotfiles
```

### Install Packages

```bash
bash ~/.linxdotfiles/install_packages.sh
```

## 2. Setup iTerm Font (if using it on the Mac) 

Above we installed the "FiraCode NerdFont" and "Meslo LGL NerdFont" using brew.  Select one of these in iTerm as your font.

## 3. Make `zsh` your default shell

### Change default shell for your user

```bash
chsh -s /usr/bin/zsh
```

Without this you will use the old version of zsh that ships with MacOS.

## 4. Install oh-my-zsh for `zsh`

Follow the instructions at [https://ohmyz.sh/](https://ohmyz.sh/)

[https://github.com/robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

This will nuke your `.zshrc` so don’t make changes before installing it.  Run through the wizard and select the defaults.


###. Install the `powerlevel10k` theme

[https://github.com/romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k)

```bash
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
```
[Powerlevel10K](https://github.com/romkatv/powerlevel10k) is a [Powerlevel9k](https://github.com/bhilburn/powerlevel9k) re-implementation
that is a lot faster.

## 5. Install `Vundle` plugin for `vim`

[https://github.com/VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## 6. Symlink `.zshrc` and `.vimrc` to this repo

Replaces these files in your home dir with symlinks to these files.

```bash
zsh ~/.linuxdotfiles/init.sh
```

# 7. Run `vim` to initialize newly-configured plugins

Run `vim` to install plugins:

```bash
vim +PluginInstall +qall
```

# 8. Customize

The [`.zshrc`](zshrc) config sources files named `*.sh` in each of the following directories after setting everything else:

1. `~/.zsh.d`
1. `~/.zsh.d.$USER`
1. `~/.zsh.d.$(hostname -s)`

Files in each of these directories are run in alphabetic order (using `sort` on filenames)

# 9. Install pfetch (optional) 

Install pfetch for a pretty login banner
https://github.com/dylanaraps/pfetch

# 9. Updates

Update everything by running the following commands:

```bash
zsh ~/.linuxdotfiles/update.sh
```

