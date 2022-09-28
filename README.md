# TS3AudioBot

[![Docker](https://img.shields.io/badge/Docker-0.0.1-0db7ed.svg)](https://hub.docker.com/r/bacanhim/ts3audiobot)

The docker container it's for devices running arm64 OS (like Raspberry Pi 4). It contains a pre-configured Teamspeak Audio Bot built by [@Splamy](https://www.github.com/Splamy/TS3AudioBot/), and i've configured it to my personal use, but there's an env table that you can use to personalize to your case.
If you get any errors, open a issue. I'll try to help ASAP.

## Building

To build it, just run the following command inside the folder.

```shell
docker build --rm -f "Dockerfile" -t ts3audiobot:latest "."
```

## Usage/Examples

It's recommended to use docker-compose so it's easier to define the env variables.

```yml
version: '2'
services:
  TS3AudioBot:
    image: bacanhim/ts3audiobot:latest
    container_name: TS3AudioBot
    environment:
      - BOT_NAME=TS3AudioBot
      - SERVER_IP=localhost
    #   - SERVER_PORT= *optional
    #   - SERVER_PASSWORD= *optional
      - BOT_IDENTITY=uKAP2ngkcvaWOLwclJje0NdDEug=
      - YOUTUBE_SEARCH=ys
    #   - WEB_PORT=58913 *optional
      - ADMIN_GROUP=9
      - USER_GROUP=10
    ports:
    # USE THE SAME WEB_PORT HERE
      - "58913:58913/tcp"
    restart: always
```

## Environment variables

| ENV | default | description |
|---|---|---|
| BOT_NAME | TS3AudioBot | Change it according to your preference. |
| SERVER_IP | localhost | Set the server ip to connect to. |
| SERVER_PORT | 9987 | By default most Teamspeak servers use 9987, change it only if you know that is different. |
| SERVER_PASSWORD |  | Server password in case it has. By default it has no password. |
| ADMIN_GROUP |  | Identify the admin group for them to have full access to the bot features. |
| USER_GROUP |  |  Identify the user group for them to have access only to !add and !ys by default, read the [@Splamy](https://github.com/Splamy/TS3AudioBot/wiki) docs to change this behavior according to your preference. |
| BOT_IDENTITY | uKAP2ngkcvaWOLwclJje0NdDEug= | You should change this to avoid identity theft. |
| YOUTUBE_SEARCH | ys | !ys allows you to search on youtube a song and plays it. you can set this to whatever you like, but don't use the exclamation point. Just the the letter's, example "ys" |
| WEB_PORT | 58913 | Web port it's so you can control the bot through the website in case you want to. |
