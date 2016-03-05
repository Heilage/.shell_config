#create basic zsh file, but will not overwrite old file if it already exists
echo "INSTALL: Touching zshrc"
touch $HOME/.zshrc
echo "INSTALL: Done"

#Collect submodules
echo "INSTALL: Setting up git repositories needed."
git submodule update --init
echo "INSTALL: Done"

#Set up symlinks
echo "INSTALL: Setting up symlinks..."
echo "source $HOME/.shell_config/.zshrc-local" >> $HOME/.zshrc
echo "INSTALL: ZSH config done"
ln -s $HOME/.shell_config/.vimrc $HOME/.vimrc
echo "INSTALL: VIM config done"
ln -s $HOME/.shell_config/.tmux.conf $HOME/.tmux.conf
echo "INSTALL: TMUX config done"
ln -s $HOME/.shell_config/submodules/avit-virtualenv-zsh-theme/avit-virtualenv.zsh-theme $HOME/.shell_config/submodules/oh-my-zsh/custom/avit-virtualenv.zsh-theme
echo "INSTALL: ZSH Theme done"

#Set up virtualenvs
echo "INSTALL: Setting up virtual environment home folder"
mkdir -p $HOME/.virtual_environments
echo "INSTALL: Done"

#Set up tmux and vim plugins
echo "INSTALL: Install TMUX plugins"
./submodules/tpm/bindings/install_plugins
echo "INSTALL: Install VIM plugins"
vim -E -c PluginInstall -c q!
echo "INSTALL: Done"


echo "All installation steps completed."
