
# .bashrc
eval "$(ssh-agent -s)" > /dev/null
alias key='ssh-add $HOME/key'

#nvm 和 nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm ls-remote --lts

#pnpm
corepack enable

#deno
curl -fsSL https://deno.land/x/install/install.sh | sh
#国内
curl -fsSL https://x.deno.js.cn/install.sh | sh
export DENO_INSTALL="/home/ubuntu/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"


#配置git
git config --global user.name "MarybethGasman"
git config --global user.email "2934482133@qq.com"

# clangd server
sudo apt-get install clangd-12

sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100


#Linux kernel 国内镜像git，非常快
https://kernel.source.codeaurora.cn/

#最新jdk
wget https://download.oracle.com/java/19/latest/jdk-19_linux-x64_bin.deb

sudo apt-get -qqy install ./jdk-19_linux-x64_bin.deb

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-19/bin/java 1919

# Mysql
sudo apt install mysql-server
CREATE USER 'tan'@'%' IDENTIFIED WITH mysql_native_password BY 'tanm146';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, INDEX, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'tan'@'%' WITH GRANT OPTION;
## Mysql改配置
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
# 重启mysql
sudo systemctl restart mysql
# 关闭mysql
sudo /etc/init.d/mysql stop

#Go的开发环境
go env -w GOPROXY=https://goproxy.cn


# trace-cmd
git clone https://kernel.source.codeaurora.cn/pub/scm/utils/trace-cmd/trace-cmd.git


# 编译linux内核安装
sudo apt-get install libssl-dev bison flex libelf-dev

# git pull (would clobber existing tag)
git fetch --tags --force


#编译内核的权限key问题
https://blog.csdn.net/qq_36393978/article/details/118157426

https://blog.csdn.net/m0_47696151/article/details/121574718

#新建swap分区
sudo fallocate -l 3G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show


#qemu
qemu-system-x86_64 -nographic -m 1024 \
    -kernel arch/x86_64/boot/bzImage \
    -initrd initramfs.img \
    -append 'console=ttyS0' \
    -nographic

# rust
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

code ~/.cargo/config

[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"
replace-with = 'ustc'
[source.ustc]
registry = "git://mirrors.ustc.edu.cn/crates.io-index"



# npm 腾讯云
npm config set registry http://mirrors.cloud.tencent.com/npm/

# 一些环境变量的配置
sudo update-alternatives --config java

# android sdk
sudo apt install sdkmanager
sudo sdkmanager "platform-tools;32.0.0" "build-tools;33.0.1" "platforms;android-32" "tools;26.1.1"
export ANDROID_HOME="/opt/android-sdk/"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"

#java
sudo apt install openjdk-17-jdk

# bpf
sudo apt install libbpf-dev llvm linux-tools-5.15.0-56-generic
## 编译安装bpftool
git clone https://github.com/libbpf/bpftool.git
git submodule update --init
cd src && make
sudo make install


#android 
https://juejin.cn/post/7019992544444416037#heading-5



#git clone慢
git config --global url."https://gitclone.com/".insteadOf https://

git config --global --unset url."https://gitclone.com/"


# nvim

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim



# clash网页

git clone -b gh-pages --depth 1 https://github.com/Dreamacro/clash-dashboard
external-ui: clash-dashboard/
