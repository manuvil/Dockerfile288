FROM httpd:2.4

EXPOSE 8080

COPY index.html /usr/local/apache2/htdocs/

RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf && \
    chgrp -R 0 /usr/local/apache2/logs && \
    chmod -R g=u /usr/local/apache2/logs

USER 1001

CMD httpd -D FOREGROUND