
FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y \
    sudo \
    curl \
    wget \
    vim \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY softether.gz /app/
RUN tar -zxvf softether.gz && \
    rm softether.gz && \
    cd /app/vpnserver && \
    make


EXPOSE 1194/udp 5555/tcp

CMD ["/app/vpnserver/vpnserver", "execsvc"]
