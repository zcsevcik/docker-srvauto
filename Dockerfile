FROM debian:wheezy-slim
LABEL maintainer "zcsevcik@gmail.com"

COPY supervisor.conf /etc/supervisord.conf
COPY libfatek.so.0 /usr/local/lib/libfatek.so.0
RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        supervisor \
        libgnutls26 libcurl3-gnutls libxml2 libcurl3

EXPOSE 3000
CMD ["supervisord", "-c", "/etc/supervisord.conf"]

