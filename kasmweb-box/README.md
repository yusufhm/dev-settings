# kasmweb-box

Run a web-accessible linux desktop box.

```sh
docker compose up -d
```

Access at [https://127.0.0.1:6901/](https://127.0.0.1:6901/).

Add the user to sudo:

```sh
docker compose exec -T --user root box bash -c \
  'echo "kasm-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/kasm-user'
```
