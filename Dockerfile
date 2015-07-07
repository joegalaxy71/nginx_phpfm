FROM joegalaxy/debase

MAINTAINER Joe Galaxy <github@simonebaglioni.com>

ENV VERSION 0.1b

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# tweak nginx config
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

#create lock & run dirs
RUN mkdir -p /var/lock/nginx /var/run/nginx /var/log/supervisor

COPY supervisor.conf /etc/supervisor/supervisor.conf

# Expose Ports
EXPOSE 443
EXPOSE 80

CMD ["/usr/bin/supervisord"]