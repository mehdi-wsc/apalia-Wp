FROM php:7.2-apache
WORKDIR /root
RUN chmod o+r /etc/resolv.conf
RUN apt update && apt install -y unzip wget nano
RUN wget --quiet "https://wordpress.org/wordpress-4.9.5.zip" \  
&& unzip wordpress-4.9.5.zip \
&& cp -R wordpress/* /var/www/html/ \
&& mv wp-config-sample.php wp-config.php
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html/
RUN mkdir /var/www/html/wp-content/uploads
RUN chown -R www-data:www-data /var/www/html/wp-content/uploads
RUN docker-php-ext-install mysqli
RUN sed -i '/Listen 80/c\Listen 8080' /etc/apache2/ports.conf
