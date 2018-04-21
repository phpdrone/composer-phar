FROM phpdrone/composer:php72-latest
RUN composer global require clue/phar-composer
ENTRYPOINT [ "phar-composer", "build" ]
