#!/bin/bash
echo "��װ������һ��ʱ�䣬�����ĵȴ�ֱ����װ���^_^"
sudo apt-get install -y cmake python-dev clang-format-3.6 

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "����Ŭ��Ϊ����װbundle����" > tmp
echo "��װ��Ͻ��Զ��˳�" >> tmp
echo "�����ĵȴ�" >> tmp
vim tmp -c "BundleInstall" -c "q" -c "q"
rm tmp

clang-format-3.6 -style=google -dump-config > ~/.clang-format 

~/.vim/bundle/YouCompleteMe/install.py --clang-completer
cp  .vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~/

echo "��װ���"
