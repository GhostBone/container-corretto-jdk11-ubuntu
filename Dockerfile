FROM ubuntu:20.04

ENV JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install vim wget gnupg2 tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime\
    && echo 'Asia/Shanghai' >/etc/timezone \
    && wget -O- https://apt.corretto.aws/corretto.key | apt-key add - \
    && echo 'deb https://apt.corretto.aws stable main' >>/etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y java-11-amazon-corretto-jdk \
    && java --version \
    && wget -O tomcat.tar.gz 'https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.60/bin/apache-tomcat-9.0.60.tar.gz' \
    && tar -xvf tomcat.tar.gz --strip-components=1 \
    && rm bin/*.bat \
    && rm tomcat.tar.gz* \
    && mv -f webapps webapps.back \
    && mkdir webapps

EXPOSE 8080
CMD ["catalina.sh", "run"]