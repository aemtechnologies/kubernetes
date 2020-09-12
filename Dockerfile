# Dockerfile to buld a basic apache container image
FROM centos:latest
LABEL description="This is a custom httpd container image"
MAINTAINER Tuhin Sinha <tuhin@aemk.org>
RUN yum install -y httpd
RUN yum install -y git
# yum update -y && yum install httpd -y 
EXPOSE 80
ENV LogLevel "info"
ADD http://192.168.1.106/policy.pdf /var/www/html
COPY ./src/index.html /var/www/html
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
