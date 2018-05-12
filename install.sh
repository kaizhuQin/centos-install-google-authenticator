#安装依赖
yum -y install pam-devel libpng-devel libtool
#安装二维码
yum install -y qrencode
#安装谷歌身份验证器
git clone https://github.com/google/google-authenticator-libpam.git
cd google-authenticator-libpam
./bootstrap.sh
./configure
make
make install
cp /usr/local/lib/security/pam_google_authenticator.so /lib64/security/
#配置sshd
echo 'auth       required     pam_google_authenticator.so' >> /etc/pam.d/sshd

#修改配置ChallengeResponseAuthentication no->yes
sed -i 's#^ChallengeResponseAuthentication no#ChallengeResponseAuthentication yes#' /etc/ssh/sshd_config

#重启sshd服务
service sshd restart
