FROM centos:latest
MAINTAINER coreych@sina.com

ADD CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
# ��װ�������
RUN yum install -y squid

RUN yum clean all
ADD squid.conf /etc/squid/squid.conf
RUN squid -z

# ����squid�����ұ�¶3128�˿�
EXPOSE 3128
CMD ["/usr/sbin/squid "]