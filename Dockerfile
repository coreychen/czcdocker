FROM centos:latest
MAINTAINER coreych@sina.com

ADD CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
# 安装常用软件
RUN yum install -y squid

RUN yum clean all
ADD squid.conf /etc/squid/squid.conf
RUN squid -z

# 启动squid服务并且暴露3128端口
EXPOSE 3128
CMD ["/usr/sbin/squid "]