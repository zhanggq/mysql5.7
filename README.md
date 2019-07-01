# Mysql 5.7

说明：

Mysql5.7的docker镜像，在官方镜像(https://hub.docker.com/_/mysql/)基础上，做了如下修改：

1. 修改时区为上海东八区
2. 优化了部分mysql参数

依赖：

需要提前安装docker

制作镜像：

```Bash
git clone git@github.com:zhanggq/mysql5.7.git
cd mysql5.7
chmod 777 build.sh
sh build.sh
```

启动Mysql容器：

```Bash
docker run -d -p 13306:3306 --name mysql.5.7 -P -e mysqld -e MYSQL_ROOT_PASSWORD=123456 -e MYSQL_DATABASE=testDb mysql:5.7
```

脚本中相关参数：

MYSQL_ROOT_PASSWORD #设置mysql的root密码，必须使用

MYSQL_DATABASE      #设置生成容器时需要新建的数据库，可选

测试Mysql容器：

```Bash
mysql -uroot -p123456 -h 127.0.0.1 -P13306 //如果能进入mysql，说明启动成功
```

Mysql基本操作参考：

1. 创建数据库
```Bash
mysql -uroot -p123456 -h 127.0.0.1 -P13306 -e "create database hcs character set utf8 collate utf8_bin;"
```

2. 创建用户及授权
```Bash
mysql -uroot -p123456 -h 127.0.0.1 -P13306 -e "grant all privileges on *.* to hcs@localhost identified by 'hcs' with grant option;"
mysql -uroot -p123456 -h 127.0.0.1 -P13306 -e "grant all privileges on *.* to 'hcs'@'%' identified by 'hcs' with grant option;"
mysql -uroot -p123456 -h 127.0.0.1 -P13306 -e "flush privileges;"
```

3. Sql文件导入
```Bash
mysql -uhcs -phcs -h127.0.0.1 -P13306 hcs < sql/initDatabase.sql
```