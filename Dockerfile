
FROM php:7.2-apache
WORKDIR /
COPY ./node_exporter.service .
RUN apt update && apt install -y unzip wget git tar prometheus-node-exporter
RUN useradd -rs /bin/false node_exporter
RUN wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz \
&& tar -xvzf node_exporter-0.18.1.linux-amd64.tar.gz \
&& mv node_exporter-0.18.1.linux-amd64/node_exporter /usr/local/bin/
RUN chown node_exporter:node_exporter /usr/local/bin/node_exporter
RUN cp -f ./node_exporter.service /etc/systemd/system/node_exporter.service

COPY ./wp-config.php .
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
