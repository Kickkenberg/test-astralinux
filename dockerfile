FROM registry.astralinux.ru/library/astra/ubi18-systemd:1.8

ENV DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends astra-safepolicy; \
    astra-modeswitch set 0; \
    apt-get purge -y --auto-remove astra-safepolicy; \
    rm -rf /var/lib/apt/lists/*

STOPSIGNAL SIGRTMIN+3

CMD ["/sbin/init"]