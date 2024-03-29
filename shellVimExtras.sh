#!/bin/bash

clear

ls ~/.zshrc > /dev/null 2>&1
# zsh ps > /dev/null 2>&1
OHMY_ZSH_INSTALLED=$?
if [ $OHMY_ZSH_INSTALLED -eq 0 ]; then
    echo "Zsh Already Installed"
else
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    cp vimrc ~/.vimrc
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

#    wget https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases ~
curl https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases > ~/.kubectl_aliases
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/endaaman/lxd-completion-zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/lxd-completion-zsh
    git clone https://github.com/esc/conda-zsh-completion  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/conda-zsh-completion
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

    sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
    sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
    sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

    mkdir -p ~/.oh-my-zsh/completions
    chmod -R 755 ~/.oh-my-zsh/completions
    ln -s /opt/kubectx/completion/_kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
    ln -s /opt/kubectx/completion/_kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh

    # First install eksctl and aws-cli
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    sudo apt install unzip -y
    unzip awscliv2.zip
    sudo ./aws/install
    
    mkdir -p ~/.oh-my-zsh/custom/plugins
    cd ~/.oh-my-zsh/custom/plugins
    eksctl completion zsh > _eksctl
    # sed  $'/ZSH_THEME="robbyrussell"/r zshrcinsert\n /ZSH_THEME="robbyrussell"/,/ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )/d' ~/.zshrc
 #   sed -i -e "/ZSH_THEME=\"robbyrussell\"/r zshrcinsert"  -e "//d"  ~/.zshrc
 # sed -i -e "/ZSH_THEME=\"bira\"/r zshrcinsert"  -e "//d"  ~/.zshrc
    sed -i -e "/ZSH_THEME=\"robbyrussell\"/c ZSH_THEME=\"bira\""  -e "//d"  ~/.zshrc
#    sed  -i $'/  git/c  git helm docker docker-compose docker-machine kubectl kube-ps1 zsh-autosuggestions zsh-syntax-highlighting vagrant vagrant-prompt' ~/.zshrc
    sed -i 's/plugins=.*/plugins=(eksctl zsh-aws-vault git golang conda-zsh-completion helm docker docker-compose docker-machine kubectl kube-ps1 zsh-autosuggestions zsh-syntax-highlighting vagrant vagrant-prompt lxd-completion-zsh)/' ~/.zshrc
    echo "source ~/.kubectl_aliases" >> ~/.zshrc
    echo "autoload bashcompinit && bashcompinit" >> ~/.zshrc
    echo "autoload -U compinit && compinit" >> ~/.zshrc
    echo "complete -C '/usr/local/bin/aws_completer' aws" >> ~/.zshrc    
fi
