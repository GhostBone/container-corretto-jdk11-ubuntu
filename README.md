# ubuntu20-corretto-jdk11-tomcat9
方便国内使用的环境(ubuntu20.04+corretto的jdk11+tomcat9)

- 解决官方镜像中的系统时区问题，统一设置为Asia/Shanghai
- 移除默认的webapps文件内的容器
- 更改apt的源为阿里源
- corretto的jdk为apt方式安装（添加了官方Key和仓库地址），之后可以以apt方式更新，可以用update-alternatives更换版本
- 添加了JAVA_HOME和CATALINA_HOME环境
- 默认暴露端口8080
- tomcat是以官方安装地址下载后解压tar的方式安装
- PWD设置为CATALINA_HOME的路径
