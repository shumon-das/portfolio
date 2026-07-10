FROM caddy:2-alpine

WORKDIR /srv

COPY index.html styles.css script.js ./
COPY assets ./assets
COPY Caddyfile /etc/caddy/Caddyfile
