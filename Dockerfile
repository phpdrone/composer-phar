FROM phpdrone/composer:php72-latest
ENV PLUGIN_COMPOSER_JSON composer.json
RUN composer global require clue/phar-composer
RUN echo "phar.readonly = Off" > /usr/local/etc/php/conf.d/phar-write.ini
ADD run.sh /run.sh
ENTRYPOINT [ "/run.sh" ]
