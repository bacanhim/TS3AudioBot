FROM arm64v8/debian:bullseye-slim

ENV BOT_NAME=TS3AudioBot
ENV SERVER_IP=localhost
ENV SERVER_PORT=9987
ENV SERVER_PASSWORD=
ENV BOT_IDENTITY=uKAP2ngkcvaWOLwclJje0NdDEug=
ENV YOUTUBE_SEARCH=ys
ENV WEB_PORT=58913
ENV ADMIN_GROUP=
ENV USER_GROUP=

WORKDIR /TS3AudioBot

# COPY CONFIG FILES TO WORKING DIR
COPY data/ /TS3AudioBot/

# INSTALL ALL NEEDED PACKAGES AND BOT BINARIES
RUN apt update && \
    apt install wget libopus-dev ffmpeg python3-pip -y && \
    pip install --upgrade youtube_dl &&\
    wget https://splamy.de/api/nightly/projects/ts3ab/master_linux_arm64/download && \
    tar -xf download && rm -r download && \
    chown -R root:root /TS3AudioBot &&\
    chmod +x start.sh

EXPOSE ${WEB_PORT}

HEALTHCHECK --interval=60s --timeout=10s --start-period=20s --retries=3 CMD wget --no-verbose --tries=1 --spider http://localhost:58913/ || exit 1

ENTRYPOINT ["/TS3AudioBot/start.sh"]
