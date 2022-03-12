# nvim-config


## Install

prepare fonts:
```
sudo apt install fonts-hack-ttf
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh Hack
```
install nodejs for lsp servers:
```
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/nodesource.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_17.x focal main" | sudo tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_17.x focal main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list
sudo apt update
sudo apt install nodejs
```
install lsp servers:
```
sudo npm install -g pyright
```
install nvim for ubuntu:
```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install python3-dev python3-pip
```
clone nvim-condig
```
git clone git@github.com:0054/nvim-config.git ~/.config/nvim/
```
