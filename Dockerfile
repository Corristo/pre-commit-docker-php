FROM alpine:3.16

RUN apk add --no-cache \
    bash \
    composer \
    php8 \
    php8-dom \
    php8-simplexml \
    php8-tokenizer \
    php8-xml \
    php8-xmlwriter \
  && mkdir /phpcbf \
	&& composer --working-dir=/phpcbf require squizlabs/php_codesniffer --dev \
	&& composer --working-dir=/phpcbf require friendsofphp/php-cs-fixer --dev \
	&& composer --working-dir=/phpcbf require phpstan/phpstan --dev \
	&& find /phpcbf -exec chmod o+r {} \; \
	&& find /phpcbf -exec chmod g+r {} \;

ENV PATH="/phpcbf/vendor/bin:$PATH"
