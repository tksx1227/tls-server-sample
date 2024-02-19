FROM nginx:stable

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/conf.d /etc/nginx/conf.d
COPY nginx/static /usr/share/nginx/html

COPY --chown=root:root --chmod=600 keys/private.pem /etc/pki/tls/private/private.pem
COPY keys/server.crt /etc/pki/tls/certs/server.crt
