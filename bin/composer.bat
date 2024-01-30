@ECHO OFF
docker run -it --rm -w /app -v %cd%://app dsvj/php-cli-tools composer %*
