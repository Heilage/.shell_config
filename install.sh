
#Get package manager
has_pkg_manager() {
	[ -x "$(which $1)" ]
}

install_deb() {	
	echo "source /usr/local/bin/virtualenvwrapper.sh" >> $HOME/.zshrc
}

install_rpm() {
	echo "source /usr/bin/virtualenvwrapper.sh" >> $HOME/.zshrc 
}

install_osx(){
	echo "source /usr/local/bin/virtualenvwrapper.sh" >> $HOME/.zshrc 
}

#create basic zsh file, but will not overwrite old file
touch $HOME/.zshrc

#Install applications
if has_pkg_manager apt-get ; then install_deb
elif has_pkg_manager dnf ; then install_rpm
elif has_pkg_manager brew ; then install_osx
else 
	echo "No supported package manager found (apt-get, dnf or brew). Exiting."
	exit 2
fi

#Collect submodules
git submodule init

#Set up symlinks
cat "source $HOME/.zshrc-local" >> $HOME/.zshrc
ln -s .vimrc $HOME/.vimrc
ln -s .tmux.conf $HOME/.tmux.conf 
ln -s submodules/avit-virtualenv-zsh-theme/avit-virtualenv.zsh-theme submodules/oh-my-zsh/themes/avit-virtualenv.zsh-theme


#Set up virtualenvs
mkdir -p $HOME/.virtual_environments

#Set up tmux and vim plugins
./submodules/tpm/bindings/install_plugins
vim -E -c PluginInstall -c q
