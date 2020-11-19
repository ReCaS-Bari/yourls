FROM yourls:1.7.9
RUN apt update && \
    apt install -y --no-install-recommends gettext-base && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod ssl

COPY https_yourls.conf /etc/apache2/sites-available/
COPY apache2-start.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["start.sh"]

