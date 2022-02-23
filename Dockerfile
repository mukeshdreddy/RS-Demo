FROM ubuntu

MAINTAINER mukeshdreddy@gmail.com

RUN apt-get update -y

RUN apt-get install nginx -y

RUN apt-get install git -y

RUN apt-get install wget -y

RUN apt-get install tree -y

COPY index.html /var/www/html/index.html

WORKDIR /var/www/html

EXPOSE 80:8080

CMD ["/usr/sbin/nginx","-g","daemon off;"]



