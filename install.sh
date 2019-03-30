#!/bin/bash
########################建立站点部署相关的结构目录###########################
cd /
mkdir www
cd /www/
mkdir server
mkdir wwwroot
mkdir wwwlogs
cd /www/server/
#<-----------安装上传下载插件----------->#
yum install lrzsz
#<-----------安装上传下载插件----------->#
Copyrightserver='
==========================================================================
                                                                         
                 建立站点部署相关的结构目录完成（Centos7） 
				   
           站点位置: /www/wwwroot   服务位置:/www/server
			   
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================';
echo -e "\033[36m$Copyrightserver\033[0m";
##############################Jdk安装包######################################
Copyrightstatus='
==========================================================================
                                                                         
             进入自定义安装状态，请根据自己的业务需要再选择（Centos7） 

    选完下面，你可以去泡一包老坛酸菜面吃了，老夫会遵循你的约定进行安装。。。
			   
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================';
echo -e "\033[36m$Copyrightstatus\033[0m";
#<-----------获取内网、公网IP----------->#
HOST_IP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d '/')
echo -e '\033[31m你的内网IP地址:\033[0m'$HOST_IP;
#echo -e '\033[31m你的公网IP地址:\033[0m';
#curl ipinfo.io/ip
#PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`
IP=`curl -s http://members.3322.org/dyndns/getip`;
echo -e '\033[31m你的公网IP地址:\033[0m'$IP;
#<-----------获取内网、公网IP----------->#
#############<-----------JDK选择----------->#############
echo
echo -n "是否安装Jdk? 1.安装 2.不安装 请输入(回车默认不安装):"
read Jdk
if [ "$Jdk" == "1" ]
	then
	echo -e "\033[31m安装Jdk-自动配置环境变量\033[0m"
	Jdk=1;
	else
	echo -e "\033[35m不安装Jdk\033[0m"
fi

############<-----------Tomcat选择----------->###########
echo -n "是否安装Tomcat? 1.安装 2.不安装 请输入(回车默认不安装):"
read Tomcat
if [ "$Tomcat" == "1" ]
	then
	echo -e "\033[31m安装Tomcat\033[0m"
	Tomcat=1;
	else
	echo -e "\033[35m不安装Tomcat\033[0m"
fi

#############<-----------Maven选择----------->#############
echo -n "是否安装Maven? 1.安装 2.不安装 请输入(回车默认不安装):"
read Maven
if [ "$Maven" == "1" ]
	then
	echo -e "\033[31m安装Maven\033[0m"
	Maven=1;
	else
	echo -e "\033[35m不安装Maven\033[0m"
fi

#############<-----------SVN选择----------->#############
echo -n "是否安装SVN? 1.安装 2.不安装 请输入(回车默认不安装):"
read SVN
if [ "$SVN" == "1" ]
	then
	echo -e "\033[31m安装SVN\033[0m"
	SVN=1;
	else
	echo -e "\033[35m不安装SVN\033[0m"
fi

#############<-----------Redis选择----------->#############
echo -n "是否安装Redis? 1.安装 2.不安装 请输入(回车默认不安装):"
read Redis
if [ "$Redis" == "1" ]
	then
	echo -e "\033[31m安装Redis\033[0m"
	Redis=1;
	else
	echo -e "\033[35m不安装Redis\033[0m"
fi

#############<-----------Nginx选择----------->#############
echo -n "是否安装Nginx? 1.安装 2.不安装 请输入(回车默认不安装):"
read Nginx
if [ "$Nginx" == "1" ]
	then
	echo -e "\033[31m安装Nginx\033[0m"
	Nginx=1;
	else
	echo -e "\033[35m不安装Nginx\033[0m"
fi
#############<-----------PHP选择----------->#############
echo -n "是否安装PHP? 1.安装 2.不安装 请输入(回车默认不安装):"
read PHP
if [ "$PHP" == "1" ]
	then
	echo -e "\033[31m安装PHP\033[0m"
	PHP=1;
	else
	echo -e "\033[35m不安装PHP\033[0m"
fi
############<-----------MYSQL选择----------->############
echo -n "是否安装MYSQL? 1.安装 2.不安装 请输入(回车默认不安装):"
read sqlstatus
if [ "$sqlstatus" == "1" ]
	then
	echo -e "\033[31m安装MYSQL\033[0m"
	sqlstatus=1;
	else
	echo -e "\033[35m不安装MYSQL\033[0m"
fi
###########<-----------phpMyAdmin----------->############
echo -n "是否安装phpMyAdmin? 1.安装 2.不安装 请输入(回车默认不安装):"
read phpMyAdmin
if [ "$phpMyAdmin" == "1" ]
	then
	echo -e "\033[31m安装phpMyAdmin\033[0m"
	phpMyAdmin=1;
	else
	echo -e "\033[35m不安装phpMyAdmin\033[0m"
fi
############<-----------Zokeerper选择-------->###########
echo -n "是否安装Zokeerper? 1.安装 2.不安装 请输入(回车默认不安装):"
read Zokeerper
if [ "$Zokeerper" == "1" ]
	then
	echo -e "\033[31m安装Zokeerper\033[0m"
	Zokeerper=1;
	else
	echo -e "\033[35m不安装Zokeerper\033[0m"
fi

############<-----------RabbitMQ选择-------->##############
echo -n "是否安装RabbitMQ? 1.安装 2.不安装 请输入(回车默认不安装):"
read RabbitMQ
if [ "$RabbitMQ" == "1" ]
	then
	echo -e "\033[31m安装RabbitMQ\033[0m"
	RabbitMQ=1;
	else
	echo -e "\033[35m不安装RabbitMQ\033[0m"
fi


############<-----------确定是否继续-------->##############
echo
echo -n "你确定安装上述已选择的任务吗？"
echo -n " 1.确定 2.取消安装 请输入(回车默认确定):";
read panduan
if [ "$panduan" = "2" ] ;then
	echo
	echo " 你已经选择取消任务安装。"
	echo " ...安装被终止"
	exit 0;
fi

##############################Jdk安装包######################################
if [ $Jdk == "1" ];then
echo "正在安装Jdk..."
echo
echo -n "由于Jdk有一百多兆(182.93MB)，如果网络不好推荐手动上传，是否需要自动下载Jdk? 1.自动下载(回车默认自动下载) 2.手动上传 请选择:"
read Jdk2
if [ "$Jdk2" == "2" ] ;then
	echo -e "\033[31m你选择了手动上传(自行上传至/www/server/下解压改文件夹名为’jdk‘即可，继续执行会自动配置环境变量)\033[0m"
	echo -e "\033[36m系统已经安装终端上传下载插件，新开命令窗体，【输入'rz':会弹出上传选择/输入'sz 文件名称':会弹出下载到电脑本地】\033[0m";
	echo -e "\033[36m如有什么不懂的可以参考我的博客http://blog.aizhuoyue.net或者《Java开发学习大纲文档》系列\033[0m";
	echo -n "我已经按上面提示去做了，回车继续执行:";
	read return;
else
	echo -e "\033[32m安装Jdk-自动下载配置环境变量\033[0m"
	wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz
	tar -zxf jdk-8u201-linux-x64.tar.gz
	rm -f jdk-8u201-linux-x64.tar.gz
	mv jdk1.8.0_201 jdk
fi

echo -e '\nJAVA_HOME=/www/server/jdk\nPATH=${JAVA_HOME}/bin:$PATH\nCLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar' >> /etc/profile
source /etc/profile
java -version
CopyrightJdk='
==========================================================================
                                                                         
                   已经安装配置JDK环境完成（Centos7） 
			   
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================';
echo -e "\033[36m$CopyrightJdk\033[0m";
fi

##############################tomcat安装包###################################
if [ $Tomcat == "1" ];then
echo "正在安装Tomcat..."
echo
echo -n "由于Tomcat有十兆左右(9.40MB)，如果网络不好推荐手动上传，是否需要自动下载Tomcat? 1.自动下载(回车默认自动下载) 2.手动上传 请选择:"
read Tomcat2
if [ "$Tomcat2" == "2" ];then
	echo -e "\033[31m你选择了手动上传(自行上传至/www/server/下解压改文件夹名为’tomcat‘即可，继续执行会自动配置环境变量)\033[0m"
	echo -e "\033[36m系统已经安装终端上传下载插件，新开命令窗体，【输入'rz':会弹出上传选择/输入'sz 文件名称':会弹出下载到电脑本地】\033[0m";
	echo -e "\033[36m如有什么不懂的可以参考我的博客http://blog.aizhuoyue.net或者《Java开发学习大纲文档》系列\033[0m";
	echo -n "我已经按上面提示去做了，回车继续执行:";
	read return;
else
	echo -e "\033[32m安装Jdk-自动下载配置Tomcat环境变量\033[0m"
	wget  http://linux.aizhuoyue.net/linux/apache-tomcat-9.0.10.tar.gz
	tar -zxvf apache-tomcat-9.0.10.tar.gz
	rm -f apache-tomcat-9.0.10.tar.gz
	mv apache-tomcat-9.0.10 tomcat
fi

cd tomcat/bin
./startup.sh

echo -e "\033[36m
==========================================================================
                                                                         
  正在启动Tomcat...，耐心等待2-3分钟方可访问http://$IP:8080（Centos7） 
		IP=`curl -s http://members.3322.org/dyndns/getip`;			
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================
\033[0m";
fi

cd /www/server/
############################<---------Maven安装包安装--------->###########################
if [ $Maven == "1" ];then
echo "正在安装Redis..."
wget http://linux.aizhuoyue.net/linux/apache-maven-3.6.0-bin.tar.gz
tar -zxvf apache-maven-3.6.0-bin.tar.gz
rm -f apache-maven-3.6.0-bin.tar.gz
mv apache-maven-3.6.0 maven
#####<----配置环境变量---->#####
echo -e '\nMAVEN_HOME=/www/server/maven\nPATH=$PATH:$MAVEN_HOME/bin\n' >> /etc/profile
source /etc/profile
echo "正在检测Maven..."
mvn -v

CopyrightJdk='
==========================================================================
                                                                         
                   已经安装配置Maven环境完成（Centos7） 
			   
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================';
echo -e "\033[36m$CopyrightJdk\033[0m";
fi

cd /www/server/
############################<---------SVN安装包安装--------->###########################
if [ $SVN == "1" ];then
echo "第一步、过使用命令yum install subversion 来进行在线安装svn的所有的包..."
yum install subversion
echo "第二步、创建svn多版本目录库..."
mkdir  -p /www/server/svnFile
echo "第三步、创建一个版本库..."
svnadmin create  /www/server/svnFile
echo "正在创建用户账号密码..."
echo -e '\nadmin = 123456\ntest = 123456\n' >> /www/server/svnFile/conf/passwd
source /www/server/svnFile/conf/passwd
sed -in-place -e "s/# anon-access = read/anon-access = read/" /www/server/svnFile/conf/svnserve.conf
sed -in-place -e "s/# auth-access = write/auth-access = write/" /www/server/svnFile/conf/svnserve.conf
sed -in-place -e "s/# password-db = passwd/password-db = passwd/" /www/server/svnFile/conf/svnserve.conf
sed -in-place -e "s/# authz-db = authz/authz-db = authz/" /www/server/svnFile/conf/svnserve.conf
echo "修改authz授权文件 添加一个组 然后在authz结尾添加以下配置..."
echo -e '
admin=admin
test=test
[/]
@admin = rw
@test = r
*=
' >> /www/server/svnFile/conf/authz
echo "正在启动SVN服务..."
svnserve -d -r /www/server/svnFile/

echo "正在查看SVN服务状态..."
ps -ef | grep svn

echo -e "\033[36m
==========================================================================
                                                                         
                   已经安装配置SVN环境完成（Centos7） 
				   
                 SVN仓库地址：svn://$IP:3690/svnFile
				 
           可写可读账号:admin  只读账号:test  密码均为123456  
			   
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================
\033[0m";
fi

cd /www/server/
############################<---------Redis安装包安装--------->###########################
if [ $Redis == "1" ];then
echo "正在安装Redis..."
wget  http://linux.aizhuoyue.net/linux/redis-3.2.9.tar.gz
tar -zxvf redis-3.2.9.tar.gz
rm -f redis-3.2.9.tar.gz
mv redis-3.2.9 redis
#####<----编译和安装---->#####
cd /www/server/redis
make
cd src
make install
#######################<---------Redis修改保护模式--------->#########################
cd /www/server/redis
echo
echo -n "Redis需要启动保护模式? 1.启动 2.不启动(回车默认不启动) 请选择:"
read Redis2
if [ "$Redis2" == "1" ] ;then
	#####<----修改配置文件---->#####
	echo -e "\033[35m你选择了Redis启动保护模式.....\033[0m";
	sed -in-place -e "s/protected-mode no/protected-mode yes/" redis.conf
else
	sed -in-place -e "s/protected-mode yes/protected-mode no/" redis.conf
	echo -e "\033[35m你选择了Redis不启动保护模式......\033[0m";
fi

#########################<----Redis是否需要后端启动模式---->#########################
echo
echo -n "Redis需要后端启动模式? 1.前端启动 2.后端启动(回车默认后端启动) 请选择:"
read Redis3
if [ "$Redis3" == "1" ] ;then
	echo
	#####<----改为前端启动-->#####
	echo -e "\033[35m你选择了Redis前端启动模式......\033[0m";
	sed -in-place -e "s/daemonize yes/daemonize no/" redis.conf
else
	#####<----改为后台启动-->#####
	sed -in-place -e "s/daemonize no/daemonize yes/" redis.conf
	echo -e "\033[35m你选择了Redis后端启动模式......\033[0m";
fi

#########################<---------Redis是修改端口--------->#########################
echo
echo -n "Redis需要修改端口(Redis初始化默认端口为6379)? 1.默认端口(回车使用默认端口) 2.自定义端口 请选择:"
read PortType
if [ "$PortType" == "2" ] ;then
	echo -n "你选择Redis自定义端口模式，请输入端口:";
	read RedisPort
	echo -e "\033[35m正在执行修改Redis端口.....\033[0m";
	###<----修改Redis端口---->#####
	sed -in-place -e "s/6379/$RedisPort/" /www/server/redis/redis.conf >/dev/null 2>&1
	echo -e "\033[35m你选择了Redis自定义端口为"$RedisPort",请牢记。\033[0m";
else
	echo -e "\033[35m你选择了Redis初始化使用默认端口6379,请牢记。\033[0m";
fi

#########################<---------Redis添加密码--------->#########################
echo
echo -n "Redis需要添加密码? 1.添加密码 2.不添加(回车默认没密码) 请选择:"
read PassWordType
if [ "$PassWordType" == "1" ] ;then
	echo -n "请你输入要设置Redis的密码:";
	read RedisPassWord
	echo -e "\033[35m正在添加Redis密码.....\033[0m";
	###<----Redis添加密码---->#####
	#echo -e "\nrequirepass $RedisPassWord" >> /www/server/redis/redis.conf
	sed -in-place -e "s/# requirepass foobared/requirepass $RedisPassWord/" redis.conf
	echo -e "\033[35m你添加了Redis密码，Redis密码为"$RedisPassWord"。\033[0m";
else
	echo -e "\033[35m你选择了Redis默认没密码......\033[0m";
fi

cd /www/server/redis/src
./redis-server ../redis.conf

CopyrightRedis='
==========================================================================
                                                                         
                  已经安装配置启动Redis完成！（Centos7） 
					
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================';
echo -e "\033[36m$CopyrightRedis\033[0m";
fi

cd /www/server/
##############################Nginx安装包####################################
if [ $Nginx == "1" ];then
echo "正在安装Nginx..."
wget  http://www.openssl.org/source/openssl-fips-2.0.10.tar.gz
wget  http://zlib.net/zlib-1.2.11.tar.gz
wget  ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.40.tar.gz
wget  http://nginx.org/download/nginx-1.10.2.tar.gz

##<----转移到/usr/local---->##
mv /www/server/openssl-fips-2.0.10.tar.gz /usr/local/openssl-fips-2.0.10.tar.gz
mv /www/server/zlib-1.2.11.tar.gz /usr/local/zlib-1.2.11.tar.gz
mv /www/server/pcre-8.40.tar.gz /usr/local/pcre-8.40.tar.gz
#<----依赖解压/usr/local---->#
cd /usr/local/
tar -zxvf openssl-fips-2.0.10.tar.gz
tar -zxvf zlib-1.2.11.tar.gz
tar -zxvf pcre-8.40.tar.gz
#####<--安装Nginx依赖--->#####
cd openssl-fips-2.0.10
./config && make && make install
cd ..
cd pcre-8.40
./configure && make && make install
cd ..
cd zlib-1.2.11
./configure && make && make install
cd ..
echo -e "安装Nginx依赖完成。。。"
#<---Nginx解压/usr/local---->#
cd /www/server/
tar -zxvf nginx-1.10.2.tar.gz
#####<----删掉压缩包---->#####
rm -f /usr/local/openssl-fips-2.0.10.tar.gz
rm -f /usr/local/zlib-1.2.11.tar.gz
rm -f /usr/local/pcre-8.40.tar.gz
rm -f nginx-1.10.2.tar.gz
#######<----修改名称---->#####
mv nginx-1.10.2 nginx
#######<----运行环境---->#####
yum install gcc-c++
Copyrightgcc='
==========================================================================
                                                                         
            正在安装Nginx插件安装环境依赖gcc-c++（Centos7） 
           注意：中途有些地方遇到需要停顿，请选择y继续执行脚本 
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================';
echo -e "\033[36m$Copyrightgcc\033[0m";
echo -e "[1;33;10m正在安装Nginx,下面选择y\033[0m"
cd nginx
./configure && make && make install
cd ..

cd /usr/local/nginx/conf/
#######<----替换文件---->#####
rm -rf /usr/local/nginx/conf/nginx.conf

wget http://linux.aizhuoyue.net/linux/nginx.conf

########<---测试程序上传部署--->##########
cd /www/wwwroot
wget http://linux.aizhuoyue.net/linux/template/default.tar.gz
wget http://linux.aizhuoyue.net/linux/template/webapps.tar.gz
tar -zxvf default.tar.gz
tar -zxvf webapps.tar.gz
rm -rf default.tar.gz webapps.tar.gz
########<---测试程序上传部署--->##########

whereis nginx
#######<----启动Nginx---->#####

/usr/local/nginx/sbin/nginx

echo -e "\033[36m
==========================================================================
                                                                         
              已经安装编译启动相关依赖和Nginx程序（Centos7）
               可以通过访问路径http://$IP 进行验证首页
     可以通过访问路径http://$IP:8080/JavaWeb 进行验证JavaWeb项目
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================
\033[0m";
fi

cd /www/server/
############################PHP安装包#####################################
if [ $PHP == "1" ];then
echo "正在安装PHP..."
#####<----安装依赖包---->#####
yum install libxml2
yum install libxml2-devel
echo
echo -n "由于PHP有二十兆左右(19MB)，如果网络不好推荐手动上传，是否需要自动下载PHP? 1.自动下载(回车自动下载安装PHP) 2.手动上传 请选择:"
read PHP
if [ "$PHP" == "2" ];then
	echo -e "\033[31m你选择了手动上传(自行上传至/www/server/下解压改文件夹名为'php'即可，继续执行会自动配置环境变量)\033[0m"
	echo -e "\033[36m系统已经安装终端上传下载插件，新开命令窗体，【输入'rz':会弹出上传选择/输入'sz 文件名称':会弹出下载到电脑本地】\033[0m";
	echo -e "\033[36m如有什么不懂的可以参考我的博客http://blog.aizhuoyue.net或者《Java开发学习大纲文档》系列\033[0m";
	echo -n "我已经按上面提示去做了，回车继续执行:";
	read return;
else
	echo -e "\033[32m安装PHP-自动下载相关依赖和PHP配置环境变量\033[0m"
	#####<----下载压缩包---->#####
	wget  http://linux.aizhuoyue.net/linux/php-7.2.7.tar.gz
	wget  http://linux.aizhuoyue.net/linux/libxml2-2.9.1.tar.gz
	#####<----解压压缩包---->#####
	tar -zxvf libxml2-2.9.1.tar.gz
	tar -zxvf php-7.2.7.tar.gz
	#####<----删掉压缩包---->#####
	rm -f libxml2-2.9.1.tar.gz
	rm -f php-7.2.7.tar.gz
	mv php-7.2.7 php
fi

#####<----安装程序包---->#####
cd /www/server/php
./configure --prefix=/usr/local/php && make && make install

#<复制php配置文件到安装目录下>#
cp /www/server/php/php.ini-development /usr/local/php/lib/php.ini

#####<----安装php-fpm---->####
yum install php-fpm

##<----Nginx支持php-fpm---->##
cp /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.confbak
sed -in-place -e "s/user = apache/user = nginx/" redis.conf
sed -in-place -e "s/group = apache/group = nginx/" redis.conf

###<---启动php-fpm服务--->####
service php-fpm start
chkconfig php-fpm on

###<---重新启动--->####
/usr/local/nginx/sbin/nginx -s reload

CopyrightPHP='
==========================================================================
                                                                         
                    正在安装编译启动PHP（Centos7） 
					
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================';
echo -e "\033[36m$CopyrightPHP\033[0m";
fi

cd /www/server/
##############################MySQL安装包####################################
if [ $sqlstatus == "1" ];then
echo "正在安装MySQL,下面遇到停留处，请选择y继续执行脚本..."
wget  http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
echo -e "安装mysql-community-release-el7-5.noarch.rpm后，会获得两个mysql的yum repo源：/etc/yum.repos.d/mysql-community.repo，/etc/yum.repos.d/mysql-community-source.repo"
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
echo -e "安装mysql"
sudo yum install mysql-server
echo -e "安装MYSQL完成，正在重启服务！"
rm -f mysql-community-release-el7-5.noarch.rpm
service mysqld restart
CopyrightMySQL='
==========================================================================
                                                                         
                   已经安装启动MySQL服务（Centos7） 
					
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================';
echo -e "\033[36m$CopyrightMySQL\033[0m";

# CopyrightMySQL2='
# ==========================================================================
                                                                         
        # 安装完成默认没有密码，下面进入MySQL修改密码,分别执行下面代码...（Centos7） 
        # 复制-->use mysql;
        # 复制-->update user set password=password('123456') where user='root';
        # 复制-->exit;
                    # 《Java开发学习大纲文档》系列                        
                                                     
                    # 欢迎使用Linux系统一键脚本
					
                                        # by：宋利军					
                                        # QQ: 1690241987  
# ==========================================================================';
# echo -e "\033[36m$CopyrightMySQL2\033[0m";
# mysql -u root

CopyrightMySQL3='
==========================================================================
                                                                         
  如果你的客户端插件连接不上，请执行下面代码解决客户端连接不上的问题...（Centos7)
   复制-->mysql -u root -p，密码框输入值一般是隐藏的，如果输不进去，按住ctrl键进行输入你的密码
   复制-->use mysql;
   复制-->update user set host = '%' where user = 'root'; 这一句执行完可能会报错，不用管它。
   复制-->FLUSH PRIVILEGES;
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================';
echo -e "\033[36m$CopyrightMySQL3\033[0m";
mysql -u root -p
fi

cd /www/server/
######################phpMyAdmin安装包#####################################
if [ $phpMyAdmin == "1" ];then
echo "正在安装phpMyAdmin..."
####wget  https://files.phpmyadmin.net/phpMyAdmin/4.8.2/phpMyAdmin-4.8.2-all-languages.tar.gz
wget http://linux.aizhuoyue.net/linux/phpMyAdmin-4.8.2-all-languages.tar.gz
tar -zxvf phpMyAdmin-4.8.2-all-languages.tar.gz
rm -f phpMyAdmin-4.8.2-all-languages.tar.gz
echo -e "将安装目录重命名为phpMyAdmin"
mv phpMyAdmin-4.8.2-all-languages phpMyAdmin
#####<----修改ip地址---->#####
#------>当前公网的IP地址 $PUBLIC_IP
sed -in-place -e 's/127.0.0.1/$PUBLIC_IP/g' /www/server/phpMyAdmin/config.inc.php
source /www/server/phpMyAdmin/config.inc.php




#<---回到server--->####
# cd ..
#<---设置Nginx访问模块--->####
# echo -e '
# server {
	# listen       80 default_server;
	# server_name  node1.bc.com;
	# root         /usr/share/nginx/html/pma;
	# index        index.php index.html;

	Load configuration files for the default server block.
	# include /etc/nginx/default.d/*.conf;

	# location / {
	# }

	# location ~ \.php$ {
		# root           html/pma/;
		# fastcgi_pass   127.0.0.1:9000;
		# fastcgi_index  index.php;
		# fastcgi_param  SCRIPT_FILENAME  /usr/share/nginx/html/pma/$fastcgi_script_name;
		# include        fastcgi_params;
	# }
# }
# ' >> /usr/local/nginx/conf/nginx.conf
# source /usr/local/nginx/conf/nginx.conf





CopyrightphpMyAdmin='
==========================================================================
                                                                         
                   已经配置phpMyAdmin完成（Centos7） 
					
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================';
echo -e "\033[36m$CopyrightphpMyAdmin\033[0m";
fi

######################Zokeerper安装包#####################################
###http://mirrors.hust.edu.cn/apache/zookeeper/
if [ $Zokeerper == "1" ];then
echo "正在安装Zokeerper..."
wget  http://mirrors.hust.edu.cn/apache/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz
tar -zxvf zookeeper-3.4.13.tar.gz
rm -f zookeeper-3.4.13.tar.gz
echo -e "将安装目录重命名为zookeeper"
mv zookeeper-3.4.13 zookeeper
cd zookeeper/conf
#####拷贝zoo_samle.cfg为zoo.cfg
cp zoo_sample.cfg zoo.cfg
#####<----修改配置文件---->#####
sed -in-place -e 's/dataDir/#dataDir/g' zoo.cfg
echo -e '\ndataDir=/www/server/zookeeper\ndataLogDir=/usr/zookeeper/log\n' >> /www/server/zookeeper/conf/zoo.cfg
source /www/server/zookeeper/conf/zoo.cfg
#####<----修改环境变量---->#####
echo -e '\nzookeeper_install=/www/server/zookeeper\nPATH=$PATH:$zookeeper_install/bin\n' >> /etc/profile
source /etc/profile
#####<----启动Zokeerper---->####
../bin/zkServer.sh start
CopyrightZokeerper='
==========================================================================
                                                                         
                     已经配置启动Zokeerper成功！（Centos7） 
        如果无法连接，请自行检查防火墙是否通行zookeeper端口(默认:2181)
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================';
echo -e "\033[36m$CopyrightZokeerper\033[0m";
fi

cd /www/server/
##############################RabbitMQ安装包#################################
if [ $RabbitMQ == "1" ];then
echo "正在下载安装Erlang..."
#1.首安装rabbitMQ所需依赖，安装erlang
yum install gcc glibc-devel make ncurses-devel openssl-devel xmlto
#在官网上下载 epel-release 网址http://rpm.pbone.net/index.php3/stat/4/idpl/29069710/dir/centos_7/com/epel-release-7-5.noarch.rpm.html
wget http://linux.aizhuoyue.net/linux/epel-release-7-5.noarch.rpm
rpm -Uvh epel-release-7-5.noarch.rpm
yum install -y erlang
#wget http://linux.aizhuoyue.net/linux/rabbitmq-server-3.6.6-1.el7.noarch.rpm
echo "进入正式的RabbitMQ安装阶段下载完成后安装..."
wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.6/rabbitmq-server-3.6.6-1.el7.noarch.rpm
yum install -y rabbitmq-server-3.6.6-1.el7.noarch.rpm
echo "直接远程获取远程仓库中的rabbitmq.config文件..."
wget http://linux.aizhuoyue.net/linux/rabbitmq.config
mv /www/server/rabbitmq.config /etc/rabbitmq/rabbitmq.config

#启动服务，要在引导时自动启动RabbitMQ   启动服务 service rabbitmq-server start
systemctl enable rabbitmq-server

#要检查RabbitMQ服务器的状态，请运行：
echo "检查RabbitMQ服务器的状态....."
systemctl status rabbitmq-server

#如果您已安装并运行防火墙 ，则必须通过防火墙允许端口8161。 运行以下命令相同。
echo "正在关闭防火墙....."
systemctl stop firewalld.service

#如果您启用SELinux，则必须运行以下命令以允许RabbitMQ服务。
echo "系统默认是启动SELinux模块的，正在设置允许RabbitMQ服务....."
setsebool -P nis_enabled 1

#启动RabbitMQ Web管理控制台，方法是运行 /sbin/rabbitmq-plugins enable rabbitmq_management 
echo "启动RabbitMQ Web管理控制台....."
rabbitmq-plugins enable rabbitmq_management

echo "设置RabbitMQ所有权提供给RabbitMQ用户....."
chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/
rabbitmqctl set_user_tags guest administrator
rabbitmqctl set_permissions -p / guest '.*' '.*' '.*'

echo "在引导时自动启动RabbitMQ....."
systemctl restart rabbitmq-server
echo "检查RabbitMQ服务器的状态....."
systemctl status rabbitmq-server

rm -rf /www/server/rabbitmq-server-3.6.6-1.el7.noarch.rpm  /www/server/epel-release-7-5.noarch.rpm

echo -e "\033[36m
==========================================================================
                      
                   RabbitMQ已经安装启动成功！（Centos7）
				
                第一种方式(推荐使用此方式)：
                #要在引导时自动启动RabbitMQ
                systemctl enable rabbitmq-server
                #要检查RabbitMQ服务器的状态，请运行：
                systemctl status rabbitmq-server
				
                第二种方式：
                #启动服务 service rabbitmq-server start
                #查看状态 service rabbitmq-server status
                #重启服务 service rabbitmq-server restart
				
                #通过运行以下命令，将RabbitMQ文件的所有权提供给RabbitMQ用户
                #现在，您将需要为RabbitMQ Web管理控制台创建管理用户。 运行以下命令相同
                #rabbitmqctl add_user admin StrongPassword
                #rabbitmqctl set_user_tags admin administrator
                #rabbitmqctl set_permissions -p / admin “.*” “.*” “.*”

				
                #关闭防火墙：systemctl stop firewalld.service
				
      通过访问路径http://$IP:15672 进行验证,账号和密码默认都是guest
					
                    《Java开发学习大纲文档》系列                        
                                                     
                    欢迎使用Linux系统一键脚本
					
                                        by：宋利军					
                                        QQ: 1690241987  
==========================================================================
\033[0m";
fi
