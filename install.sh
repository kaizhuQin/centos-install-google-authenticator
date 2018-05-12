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
