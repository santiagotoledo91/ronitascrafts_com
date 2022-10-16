### Setup

- Make a copy of `docker-compose.override.example.yml` named `docker-compose.override.yml`
- Set the secrets
- run `docker-compose up -d`


### Using behind a reverse proxy

It's noticeable as the console will be full of errors and the styles are missing, to fix it copy the contents of `wp-config.example.php` at the very beginning of the `wp-config.php` file.
