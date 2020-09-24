FROM php:7.2-apache
RUN chmod o+r /etc/resolv.conf
RUN apt update && apt install wget
RUN wget --quiet "https://wordpress.org/wordpress-4.9.5.zip" \  
&& unzip wordpress-4.9.5.zip \
&& mv wordpress-4.9.5 wordpress \
&& cp -R wordpress /var/www/html/  
RUN chown -R www-data:www-data /var/www/html/wordpress/
RUN chmod -R 755 /var/www/html/wordpress/
RUN mkdir /var/www/html/wordpress/wp-content/uploads
RUN chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads
