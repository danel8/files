#!/bin/bash

#更换为中科大源。
sed -i 's/debian.org/ustc.edu.cn/g' /etc/apt/sources.list

#更新软件列表。
apt update
apt install wget -y
#使用密钥登录ssh server。
wget -e -O id_rsa_tencent_sh.pub  "http://f3.pw:2222" https://github.com/danel8/files/blob/d811511d13f14537d7d34cb28b7c9d94c41e792c/id_rsa_tencent_sh.pub && mkdir /root/.ssh -p 

rm -f id_rsa_tencent_sh.pub
cat id_rsa_tencent_sh.pub >>/root/.ssh/authorized_keys

sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config

sed -i 's/PubkeyAuthentication yee/PubkeyAuthentication yes/g'  /etc/ssh/sshd_config

sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g'  /etc/ssh/sshd_config

sed -i 's/X11Forwarding yes/X11Forwarding no/g' /etc/ssh/sshd_config

sed -i 's/X11UseLocalhost yes/X11UseLocalhost no/g' /etc/ssh/sshd_config

sed -i 's/X11UseLocalhost yes/X11UseLocalhost no/g' /etc/ssh/sshd_config


#restart ssh server.
systemctl restart sshd

###安装youtube-dl yt-dlp you-get
##更改国内源。
apt install python3 -y
apt install python3-pip -y
mkdir /root/.pip -p
echo "[global]
timeout = 60
index-url = https://pypi.douban.com/simple
trusted-host = pypi.douban.com" >/root/.pip/pip.conf

###安装。
pip3 install -U pip
pip3 install youtube-dl yt-dlp you-get

