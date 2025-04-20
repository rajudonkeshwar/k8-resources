FROM nginx:stable-alpine3.20-perl
RUN rm -rf /usr/share/html/index.html
COPY index.html /usr/share/html/
