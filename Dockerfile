FROM alpine:latest

LABEL maintainer="maak.daniel@gmail.com" \
        version="1.0.0" \
        description="Small and simple DNS Server with dnsmasq"

RUN apk --no-cache --update add dnsmasq && \
    mkdir /etc/dnsmasq

COPY dnsmasq.conf /etc/dnsmasq.conf

EXPOSE 53/tcp 53/udp
VOLUME [ "/etc/dnsmasq" ]
VOLUME [ "/etc/dnsmasq.d/" ]

ENTRYPOINT [ "dnsmasq", "--keep-in-foreground", "--log-queries=extra", "--log-facility=-" ]
