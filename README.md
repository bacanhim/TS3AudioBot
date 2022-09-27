# TS3AudioBot
A docker container for devices running arm64 OS (like Raspberry Pi 4). It contains a pre-configured Teamspeak Audio Bot built by [@Splamy](https://www.github.com/Splamy/TS3AudioBot/), and i've configured to my personal use, but there's an env table that you can use to personalize to your case.

## Usage/Examples
It's recommended to use docker-compose so it's easier to set env variables.
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
      - BOT_IDENTITY=MCkDAgbAAgEgAiB9Wm4XsCFB8cKVJg8D/e5cbvm2+9mdUuBElxi+zABbww==
      - YOUTUBE_SEARCH=ys
    #   - WEB_PORT=58913 *optional
      - ADMIN_GROUP=9
      - USER_GROUP=10
    ports:
    # USE THE SAME WEB_PORT HERE
      - "58913:58913/tcp"
    restart: always
```

## Environment variables:

| ENV              | default                                                     |                                                                                                                                                          |
|------------------|-------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| BOT_NAME         | TS3AudioBot                                                 | Change it according to your preference.                                                                                                                  |
| SERVER_IP        | localhost                                                   | Set the server ip to connect to.                                                                                                                         |
| SERVER_PORT      | 9987                                                        | By default most teamspeak servers use 9987, change it only if you know that is different.                                                                |
| SERVER_PASSWORD  |                                                             | Server password in case it has. By default it has no password.                                                                                           |
| ADMIN_GROUP      |                                                             | Specify admin group for them to gave full access to bot features.                                                                                        |
| USER_GROUP       |                                                             | Specify user group for them to gave access only to !add and !ys by default, read the Splamy docs to change this behavior according to your preference.   |
| BOT_IDENTITY     | MCkDAgbAAgEgAiB9Wm4XsCFB8cKVJg8D/e5cbvm2+9mdUuBElxi+zABbww==| You should change this, just in case no one                                                                                                              |
| YOUTUBE_SEARCH   | ys                                                          | !ys enables you to search on youtube a song and plays it. you can set this whatever you like, but don't use exclamation point. just the word. Example: ys|
| WEB_PORT         | 58913                                                       | Web port for you to control the bot in case you want it.                                                                                                 |
