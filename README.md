## container-corretto-jdk11-ubuntu
方便中国境内使用的环境(ubuntu:latest+corretto的jdk11)

**[Docker Hub](https://hub.docker.com/r/ghostbone/corretto)**
**[Github](https://github.com/GhostBone/container-corretto-jdk11-ubuntu)**

- 基于官方Ubuntu最新镜像的tag
- 时区统一设置为Asia/Shanghai
- 环境变量配置终端可以256彩色显示
- 编码默认为C.UTF-8
- ~~更改apt的源为阿里源~~ **使用默认源（Ubuntu官方源已经很快了，不使用镜像源是因为发现阿里源近期变得非常慢甚至没有官方快了只有大概几十kb每秒）**
- corretto的jdk为apt方式安装（添加了官方Key和仓库地址），之后可以以apt方式更新，可以用update-alternatives更换版本
- PWD为/root
- 添加vim

## 使用方法
此dockerfile构建的镜像已经push到了Docker Hub上，可以pull来使用：

    sudo docker pull ghostbone/corretto:11

OR

使用dockerfile的FROM命令基于此镜像来构建使用：

    FROM ghostbone/corretto:11
