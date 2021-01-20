FROM php:7.2-apache
WORKDIR /
COPY ./node_exporter.service .
