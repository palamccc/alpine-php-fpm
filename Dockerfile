FROM alpine:edge
RUN apk add --no-cache php7-mysqli php7-fpm php7-zlib php7-session php7-opcache \
    && { \
      echo '[global]'; \
      echo 'error_log = /proc/self/fd/2'; \
      echo 'daemonize = no'; \
      echo '[www]'; \
      echo 'user = nobody'; \
      echo 'group = nobody'; \
      echo 'listen = 0.0.0.0:9000'; \
      echo 'pm = dynamic'; \
      echo 'pm.max_children = 5'; \
      echo 'pm.start_servers = 1'; \
      echo 'pm.min_spare_servers = 1'; \
      echo 'pm.max_spare_servers = 3'; \
      echo 'catch_workers_output = yes'; \
    } > /etc/php7/php-fpm.d/www.conf
EXPOSE 9000
CMD ["php-fpm7"]