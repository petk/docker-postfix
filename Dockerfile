FROM alpine:3.6

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/petk/docker-postfix.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="Peter Kokot" \
      org.label-schema.name="docker-postfix" \
      org.label-schema.description="Docker Image with Postfix Mail Server" \
      org.label-schema.url="https://github.com/petk/docker-postfix"

ENV MYHOSTNAME="postfix" \
    MYDOMAIN="my.example.com"

COPY postfix/etc/aliases /etc/aliases
COPY docker-entrypoint /usr/local/bin/docker-entrypoint

RUN apk --no-cache add postfix mailx \
    && newaliases \
    && touch /var/log/mail.log

EXPOSE 25

ENTRYPOINT ["docker-entrypoint"]

CMD ["sh", "-c", "postfix start; tail -F /var/log/mail.log"]
