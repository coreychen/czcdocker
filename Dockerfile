FROM scratch
MAINTAINER netease
ADD centos-7-docker.tar.xz /    

LABEL name="CentOS Base Image" \
    vendor="CentOS" \
    license="GPLv2" \
    build-date="20160701"    

ADD CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
# ��װ�������
RUN yum install -y openssh-server
RUN yum install -y squid
# ��ʼ��ssh��½
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''
RUN echo "RSAAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config    

RUN yum clean all

# ����sshd�����ұ�¶22�˿�
RUN mkdir /var/run/sshd    

EXPOSE 22    

CMD ["/usr/sbin/sshd", "-D"]