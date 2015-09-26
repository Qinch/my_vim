#参考:
#https://github.com/ma6174/vim
#http://blog.csdn.net/xzz_hust/article/details/23178981
#

#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"

sudo apt-get install -y cmake python-dev clang-format-3.6 
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "正在努力为您安装bundle程序" > tmp
echo "安装完毕将自动退出" >> tmp
echo "请耐心等待" >> tmp

cp vimrc ~/.vimrc
vim tmp -c "BundleInstall" -c "q" -c "q"
rm tmp
clang-format-3.6 -style=google -dump-config > ~/.clang-format 
~/.vim/bundle/YouCompleteMe/install.py --clang-completer
cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~/

echo "安装完成"
