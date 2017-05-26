FROM alpine:3.6

ENV MYHOSTNAME postfix
ENV MYDOMAIN my.example.com

COPY postfix/etc/aliases /etc/aliases
COPY docker-entrypoint /usr/local/bin/docker-entrypoint

RUN apk --no-cache add postfix mailx \
    && newaliases \
    && touch /var/log/mail.log

EXPOSE 25

ENTRYPOINT ["docker-entrypoint"]

CMD ["sh", "-c", "postfix start; tail -F /var/log/mail.log"]
