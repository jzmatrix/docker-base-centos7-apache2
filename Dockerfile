FROM jzmatrix/centos7:20200123_0613
################################################################################
RUN yum -y update && \
    yum -y install httpd && \
    yum clean all
################################################################################
ADD config/httpd/httpd.conf /etc/httpd/conf/httpd.conf
ADD config/sysconfig/httpd /etc/sysconfig/httpd
ADD run-httpd.sh /run-httpd.sh
################################################################################
RUN chmod 644 /etc/sysconfig/httpd && \
	chmod 755 /run-httpd.sh
################################################################################
CMD [ "/run-httpd.sh" ]
