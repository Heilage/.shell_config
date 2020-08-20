#!env /bin/sh

# OS X Install file

#Set the proper WD
cd 

# Get oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
# Set ZSH file
ln -s -f ~/.shell_config/.zshrc

# Setup Tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f ~/.tmux/.tmux.conf