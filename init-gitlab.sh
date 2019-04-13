#! /bin/bash
#centos7.4 gitlab安装脚本
#时间时区同步，修改主机名
ntpdate cn.pool.ntp.org
hwclock --systohc
echo "*/30 * * * * root ntpdate -s 3.cn.poop.ntp.org" >> /etc/crontab

sed -i 's|SELINUX=.*|SELINUX=disabled|' /etc/selinux/config
sed -i 's|SELINUXTYPE=.*|#SELINUXTYPE=targeted|' /etc/selinux/config
sed -i 's|SELINUX=.*|SELINUX=disabled|' /etc/sysconfig/selinux 
sed -i 's|SELINUXTYPE=.*|#SELINUXTYPE=targeted|' /etc/sysconfig/selinux
setenforce 0 && systemctl stop firewalld && systemctl disable firewalld 

rm -rf /var/run/yum.pid 
rm -rf /var/run/yum.pid
yum -y install curl policycoreutils openssh-server openssh-clients
yum -y install postfix && systemctl enable postfix && systemctl start postfix
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | bash
yum -y install gitlab-ce
gitlab-ctl reconfigure
#访问http://192.168.127.74

yum -y install git 
git config –global user.name "Administrator"
git config –global user.email "admin@example.com"
git clone http://RHEL7-4/root/test.git
cd test
touch README.md
echo Yang > README.md
git add README.md
git commit -m “add README”
git push -u origin master

#查看工作环境：git config --list
#查看仓库状态：git status
#直接删除数据：git rm -f database 
#修改文件名称: git mv readme.txt introduction.txt
#查看历史记录: git log (-p差异 -2近二次 --stat增减行 --pretty=fuller详细 )
#还原数据指针：git reset --hard HEAD^ （上一个提交版本叫HEAD^，上上一个版本叫做HEAD^^，一般用HEAD~5来表示往上数第五个提交版本）
#查看所有历史记录：git reflog   还原数据：git reset --hard 5cee15b 
#某个文件内容还原: git checkout -- readme.txt





