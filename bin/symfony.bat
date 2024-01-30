@ECHO OFF
docker run -it --rm -w /home/www-data -v %cd%:/home/www-data dsvj/php-cli-tools symfony %*
