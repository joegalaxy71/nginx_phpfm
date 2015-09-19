FROM joegalaxy/debase

MAINTAINER Joe Galaxy <github@simonebaglioni.com>

ENV VERSION 0.2b

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# tweak nginx config
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# create lock & run dirs
RUN mkdir -p /var/lock/nginx /var/run/nginx /var/log/supervisor

# copy configuration files
COPY conf/supervisor.conf /etc/supervisor/supervisor.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/php5-fpm.conf /etc/

;#create the socket file
;RUN mkdir -p /var/run/nf
;RUN mkfifo /var/run/nf/nf.sock
;RUN chmod ugo+rwx /var/run/nf/nf.sock

# Expose Ports
EXPOSE 443
EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisor.conf"]

#CMD ["/usr/sbin/nginx"]