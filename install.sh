#create basic zsh file, but will not overwrite old file if it already exists
touch $HOME/.zshrc

#Collect submodules
git submodule update --init

#Set up symlinks
echo "source $HOME/.shell_config/.zshrc-local" >> $HOME/.zshrc
ln -s $HOME/.shell_config/.vimrc $HOME/.vimrc
ln -s $HOME/.shell_config/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/.shell_config/submodules/avit-virtualenv-zsh-theme/avit-virtualenv.zsh-theme $HOME/.shell_config/submodules/oh-my-zsh/custom/avit-virtualenv.zsh-theme

#Set up virtualenvs
mkdir -p $HOME/.virtual_environments

#Set up tmux and vim plugins
./submodules/tpm/bindings/install_plugins
vim -E -c PluginInstall -c q
