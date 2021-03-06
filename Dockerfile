FROM debian:jessie

RUN apt-get update && \
    apt-get install -y git && \
    apt-get install -y wget && \
    wget https://github.com/inclusivelint/inclusivelint/releases/download/0.0.5/install.sh -O- | tr -d '\r' >install.sh && \
    chmod +x ./install.sh && \
    ./install.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]