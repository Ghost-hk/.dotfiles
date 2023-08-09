#!/bin/bash
sudo dnf update && sudo dnf install rofi xrandr bspwm sxhkd zsh alacritty polybar dunst make feh zsh picom playerctl tmux &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
curl -s https://ohmyposh.dev/install.sh | sudo bash -s
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions  
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 

git clone https://github.com/Ghost-hk/.dotfiles.git $HOME/Downloads/ 

DOTFILES="$HOME/Downloads/.dotfiles"
CONF="$HOME/.config"

if [ -d $HOME/.config ]; then
    cp -r "$DOTFILES/bspwm" $CONF  
    cp -r "$DOTFILES/sxhkd" $CONF  
    cp -r "$DOTFILES/rofi" $CONF  
    cp -r "$DOTFILES/alacritty" $CONF  
    cp -r "$DOTFILES/polybar" $CONF  
    cp -r "$DOTFILES/picom" $CONF  
    cp -r "$DOTFILES/dunst" $CONF  
    cp -r "$DOTFILES/.poshthemes" $HOME
    cp .zshrc $HOME  
    mkdir $HOME/.fonts
    cp -r "$DOTFILES/fonts/*" $HOME/.fonts
else
    mkdir "$HOME/.config"
    cp -r "$DOTFILES/bspwm" $CONF  
    cp -r "$DOTFILES/sxhkd" $CONF  
    cp -r "$DOTFILES/rofi" $CONF  
    cp -r "$DOTFILES/alacritty" $CONF  
    cp -r "$DOTFILES/polybar" $CONF  
    cp -r "$DOTFILES/picom" $CONF  
    cp -r "$DOTFILES/dunst" $CONF  
    cp -r "$DOTFILES/.poshthemes" $HOME
    cp .zshrc $HOME         
    mkdir $HOME/.fonts
    cp -r "$DOTFILES/fonts/*" $HOME/.fonts

fi

#install other apps 

# vs codium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium

# add flatpac
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client
flatpak install flathub org.telegram.desktop
flatpak install flathub io.github.mimbrero.WhatsAppDesktop
flatpak install flathub com.discordapp.Discord
flatpak install flathub io.github.Figma_Linux.figma_linux
flatpak install flathub com.google.Chrome
flatpak install flathub com.getpostman.Postman
flatpak install flathub io.neovim.nvim

git clone https://github.com/noctuid/zscroll $HOME/Downloads
sudo python3 zscroll/setup.py install

git config --global user.email "ibradawdi1@gmail.com"
git config --global user.name "Ghost-hk"
