FROM php:7.2-apache
WORKDIR /
COPY ./wp-config.php .
RUN chmod o+r /etc/resolv.conf
RUN apt update && apt install -y unzip wget git prometheus-node-exporter
RUN wget --quiet "https://wordpress.org/wordpress-4.9.5.zip" \  
&& unzip wordpress-4.9.5.zip \
&& cp -R wordpress/* /var/www/html/ \
&& rm /var/www/html/wp-config-sample.php \
&& cp wp-config.php /var/www/html/ \
&& sed -i '/Listen 80/c\Listen 8080' /etc/apache2/ports.conf
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html/
RUN mkdir /var/www/html/wp-content/uploads
RUN chown -R www-data:www-data /var/www/html/wp-content/uploads
RUN docker-php-ext-install mysqli
RUN echo 'root:Docker!' | chpasswd
