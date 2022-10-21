FROM ubuntu:latest
ENV TERM=xterm-256color LANG=C.UTF-8
WORKDIR /root

    # sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    # sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends vim wget ca-certificates gnupg2 tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && wget -O ./corretto.key https://apt.corretto.aws/corretto.key \
    && gpg --no-default-keyring --keyring ./corretto-key.gpg --import ./corretto.key \
    && gpg --no-default-keyring --keyring ./corretto-key.gpg --export > ./corretto.gpg \
    && cp ./corretto.gpg /etc/apt/trusted.gpg.d/corretto.gpg \
    && rm ./corretto* \
    && rm -r ./.gnupg \
    && apt-get remove -y wget ca-certificates gnupg2 \
    && apt-get clean \
    && apt-get autoremove -y \
    && echo 'deb https://apt.corretto.aws stable main' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends java-11-amazon-corretto-jdk \
    && echo '----------------jdk----------------' \
    && java --version \
    && echo '--------------encoding-------------' \
    && locale \
    && echo '----------------now----------------' \
    && date

CMD ["bash"]
