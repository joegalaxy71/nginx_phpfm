FROM debian:8.1
MAINTAINER Joe Galaxy <github@simonebaglioni.com>

ENV VERSION 0.1b

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Update System
RUN apt-get update
RUN apt-get -y upgrade

# Basic Requirements (we install nginx, php5-fpm, supervisor)
RUN apt-get -y install nginx php5-fpm php5-mysql curl git unzip supervisor

# Install Extra PHP Modules
RUN apt-get -y install php5-curl php5-gd php5-intl php5-mcrypt

# tweak nginx config
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

#create lock & run dirs
RUN mkdir -p /var/lock/nginx /var/run/nginx /var/log/supervisor

COPY supervisor.conf /etc/supervisor/supervisor.conf

# Expose Ports
EXPOSE 443
EXPOSE 80

CMD ["/usr/bin/supervisord"]