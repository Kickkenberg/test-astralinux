FROM nazhmuk/astralinux:1.8

ENV container docker

STOPSIGNAL SIGRTMIN+3

RUN apt-get update && \
    apt-get install -y systemd systemd-sysv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Отключаем аппаратно-зависимые сервисы
RUN systemctl disable openipmi.service  true && \
    systemctl mask openipmi.service  true && \
    systemctl disable prometheus.service  true && \
    systemctl mask prometheus.service  true

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/sbin/init"]