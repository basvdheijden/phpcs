FROM php:8.0-fpm-alpine3.12

COPY --from=composer /usr/bin/composer /usr/bin/composer

# Install git & zip
RUN apk add --update git zip

# Install Drupal Coding Standards
RUN composer global require --prefer-dist drupal/coder:8.x-3.x-dev
RUN ln -s ~/.composer/vendor/bin/phpcs /usr/bin/phpcs
RUN ln -s ~/.composer/vendor/bin/phpcbf /usr/bin/phpcbf

# Set Drupal as default CodeSniffer Standard
RUN phpcs --config-set installed_paths /root/.composer/vendor/drupal/coder/coder_sniffer/ \
    && phpcs --config-set default_standard Drupal,DrupalPractice

COPY scripts /var/scripts

ENV PHPCS_FLAGS ""

WORKDIR /app

CMD ["/var/scripts/test.sh"]
