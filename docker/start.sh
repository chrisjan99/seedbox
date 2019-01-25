#!/bin/bash
/usr/sbin/php-fpm7.0 --daemonize --fpm-config /etc/php/7.0/fpm/php-fpm.conf
/usr/sbin/nginx -c /share/nginx/config/nginx.conf -g "daemon off;"
