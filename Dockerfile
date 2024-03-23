FROM wordpress
RUN echo 'deb https://mirrors.huaweicloud.com/debian/ bookworm main non-free contrib' > /etc/apt/sources.list
RUN apt update && apt install -y libpq-dev git
RUN git clone https://mirror.ghproxy.com/https://github.com/phpredis/phpredis /usr/src/php/ext/redis
RUN docker-php-ext-install redis
RUN cd /var/www/html
EXPOSE 80
CMD ["apache2-foreground"]

