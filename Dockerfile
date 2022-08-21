FROM centos
# MAINTAINER shadaabsikander@gmail.com
# RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
# RUN yum update
RUN yum install -y httpd
RUN yum install -y zip unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page247/kindle.zip  /var/www/html/
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html
# RUN unzip kindle.zip
RUN unzip photogenic.zip
# RUN cp -rvf markups-kindle/* .
RUN cp -rvf photogenic/* .
# RUN rm -rf __MACOSX markups-kindle kindle.zip
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
