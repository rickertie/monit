#
# Dockerfile for monit
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN apk update \
    && apk upgrade \
    && apk add bash \
    && apk add jq \
    && apk add curl \
    && apk add git

RUN apk add --no-cache monit

COPY data /etc/monit

RUN set -xe \
    && chmod 600 /etc/monit/monitrc \
    && ln -sf /etc/monit/monitrc /etc/monitrc \
    && mkdir -p /var/lib/monit/events

 RUN git clone https://github.com/matriphe/monit2telegram.git
    && cd monit2telegram
    && cp telegramrc /etc/telegramrc
    && cp sendtelegram.sh /usr/local/bin/sendtelegram
    && chmod +x /usr/local/bin/sendtelegram
    && cp monit2telegram.sh /usr/local/bin/monit2telegram
    && chmod +x /usr/local/bin/monit2telegram
    
VOLUME /etc/monit /var/lib/monit

EXPOSE 2812

CMD ["monit", "-Ic", "/etc/monitrc"]
