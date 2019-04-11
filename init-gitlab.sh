#! /bin/bash
#centos7.4 gitlab安装脚本

chmod -R 777 /usr/local/src/memcached
#时间时区同步，修改主机名
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

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



