FROM debian:bookworm-slim

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    rsync

COPY --chmod=0644 rsyncd.conf /etc/rsyncd.conf

CMD ["rsync", "--daemon", "--no-detach", "--config", "/etc/rsyncd.conf", "--log-file", "/dev/stdout", "--port", "873"]
