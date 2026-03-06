# Описание
Docker-контейнер на базе nazhmuk/astralinux:1.8 с рабочим systemd.

# Сборка образа

docker build -t astra-systemd .

# Запуск контейнера

docker run -d --name astra-systemd \
  --privileged \
  --cgroupns=host \
  --tmpfs /run \
  --tmpfs /run/lock \
  -v /sys/fs/cgroup:/sys/fs/cgroup:rw \
  astra-systemd

# Проверка

docker exec -it astra-systemd-test bash
ps -p 1 -o comm=        # ожидаем systemd

systemctl status         # ожидаем State: running

systemctl --failed       # активные failed-сервисы отключены

# Особенности
  
- systemd работает как PID 1.  
- Контейнер полностью готов для тестирования systemctl.
