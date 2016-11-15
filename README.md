# .vim
## Setup
### Clone dotfiles repo

```bash
git clone https://github.com/teleivo/dotvim.git ~/.vim
```

### Install Vundle

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### Install vim plugins

```bash
vim +PluginInstall +qall
```

### Create symlink to vimrc

```bash
ln -s ~/.vim/vimrc ~/.vimrc
```

## Adapt
### Install vim plugins
To install a new plugin add a new line between
`call vundle#begin()` and `call vundle#end()`

Open vim and enter command
```
:PluginInstall
```

which will install the new plugin

### Update vim plugins

Open vim and enter command
```
:PluginUpdate
```

