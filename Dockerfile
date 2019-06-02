FROM alpine:latest

LABEL maintainer="maak.daniel@gmail.com" \
        version="1.0.0" \
        description="Small and simple DNS Server with dnsmasq"

RUN apk --no-cache --update add dnsmasq && \
    mkdir /etc/dnsmasq && \
    echo "conf-file=/etc/dnsmasq/dnsmasq.conf" > /etc/dnsmasq.conf

COPY *.conf /etc/dnsmasq/

EXPOSE 53/tcp 53/udp
VOLUME [ "/dnsmasq" ]

ENTRYPOINT [ "dnsmasq", "-v", "-k", "-q" ]
