FROM httpd:2.4

EXPOSE 8080

RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf && \
    chgrp -R 0 /usr/local/apache2/logs  /usr/local/apache2/htdocs && \
    chmod -R g=u /usr/local/apache2/logs /usr/local/apache2/htdocs

USER 1001

COPY ./*.html /usr/local/apache2/htdocs/

CMD httpd -D FOREGROUND