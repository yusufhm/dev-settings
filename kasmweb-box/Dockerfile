ARG KASMWEB_VERSION

FROM kasmweb/core-ubuntu-jammy:${KASMWEB_VERSION}

USER root

COPY etc /etc

RUN set -e; \
  echo "kasm-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/kasm-user; \
  add-apt-repository -y ppa:mozillateam/ppa; \
  apt-get install -y firefox
