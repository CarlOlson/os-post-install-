# Install Packages
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential curl elixir emacs26 esl-erlang git zsh zsh-syntax-highlighting

# Node, NVM, Yarn
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install 9
npm i -g yarn

# Ruby, RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

# Oh-My-Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Emacs
mkdir $HOME/.emacs.d
ln -s $HOME/git/environment/init.el $HOME/git/.emacs.d/init.el

# Git
git config --global user.name "Carl Olson"
git config --global user.email "CarlOlson@users.noreply.github.com"
