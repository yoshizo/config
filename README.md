# Dotfiles

## Provisioning

```
sudo apt-get install -y tmux
sudo apt-get install -y xclip 
sudo apt-get install -y vim-gtk vim-athena vim-gnome
sudo apt-get install -y sendmail

git clone git://github.com/yoshizo/dotfiles.git
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/gvimrc ~/.gvimrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/bashrc ~/.bashrc
```
