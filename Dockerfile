ARG BASE_IMAGE_TAG=7.4-apache
#Base Image
FROM php:${BASE_IMAGE_TAG}


#Working Directory
WORKDIR /var/www/html

#MediaWiki Installation
ADD ["files/mediawiki-1.35.0.tar.gz", "/var/www/html/"]
RUN cp -r mediawiki-1.35.0/* .


#Entrypoint
Entrypoint exec /usr/sbin/apachectl -DFOREGROUND
