export NVM_VER="0.33.8"
export NODE_VER="8.10.0"
export GO_VER="1.10"
export GIT_USER="arieljimenez"

echo "Updating system and installing tools"
sudo apt update && sudo apt upgrade -y && sudo apt auto-remove -y

sudo apt install -y git

echo "=========================== JS Env stuff"
echo "Installing nvm dependencies"
sudo apt-get install -y build-essential \
                        libssl-dev \
                        python \
                        python-pip \
                        python3 \
                        python3-pip \
                        tmux

echo "Installing nvm v$NVM_VER"
curl https://raw.githubusercontent.com/creationix/nvm/v$NVM_VER/install.sh | bash

echo "Installing node v$NODE_VER"
nvm install v$NODE_VER

echo "=========================== Golang Env stuff"
# Download && Decompress && Delete tar file
sudo wget https://storage.googleapis.com/golang/go$GO_VER.linux-amd64.tar.gz -P /usr/local/ && \
    sudo tar -xf /usr/local/go$GO_VER.linux-amd64.tar.gz -C /usr/local/ && \
    sudo rm /usr/local/go$GO_VER.linux-amd64.tar.gz

#if is already in the current dir
# sudo tar -xf /vagrant/go$GO_VER.linux-amd64.tar.gz -C /usr/local
mkdir -p /vagrant/Code/go/bin \
         /vagrant/Code/go/src/github.com/$GIT_USER

# Adding go stuff to the path
echo "export PATH=$PATH:/usr/local/go/bin" >> /home/vagrant/.bashrc
echo "export GOPATH=/vagrant/Code/go/src" >> /home/vagrant/.bashrc
echo "export GOROOT=/usr/local/go" >> /home/vagrant/.bashrc
echo "source /vagrant/scripts/.env" >> /home/vagrant/.basrc

echo "FINAL STEPS ========== "
echo "cd /vagrant && tmux switch-client -t vagrant" >> /home/vagrant/.profile
echo "========= FINISH ========== "
