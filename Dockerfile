FROM php:8.2-apache

RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www/html
COPY . /var/www/html

# ★これ追加（超重要）
RUN echo "DirectoryIndex index.php index.html" > /etc/apache2/conf-available/custom.conf \
 && a2enconf custom

RUN sed -i 's/80/${PORT}/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf
