PHP CLI Tools

Overview
    Creates a Docker image that allows for the execution of various programs related to PHP development, so that we
 don't have to install them on the local machine.

Put the batch files located in `bin/` into a directory that is in the %PATH% environment.

Installation/Usage:
 - Run `docker compose build` to create the image.
 - Either copy the files located in the `bin/` folder to a folder in your %PATH%, or add the `bin/` folder
   to the path.

Tools:
- Symfony CLI
- Composer CLI
- PHP
  - PHP v7.4

Added PHP Extensions:
- opcache
- intl
- imap
- soap
- gd

Notes:
  The .env file is currently unused.