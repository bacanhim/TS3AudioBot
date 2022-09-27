#!/bin/bash
# BOT TOML CREDENTIALS
sed -i 's\$SERVER_IP:$SERVER_PORT\'${SERVER_IP}:${SERVER_PORT}'\g' bots/default/bot.toml
sed -i 's\$SERVER_PASSWORD\'${SERVER_PASSWORD}'\g' bots/default/bot.toml
sed -i 's\$BOT_NAME\'${BOT_NAME}'\g' ts3audiobot.toml
sed -i 's\$BOT_IDENTITY\'${BOT_IDENTITY}'\g' bots/default/bot.toml
sed -i 's\$YOUTUBE_SEARCH\'${YOUTUBE_SEARCH}'\g' bots/default/bot.toml
# WEB PORT
sed -i 's\$WEB_PORT\'${WEB_PORT}'\g' ts3audiobot.toml
# RIGHTS TOML GROUPS
sed -i 's\$ADMIN_GROUP\'${ADMIN_GROUP}'\g' rights.toml
sed -i 's\$USER_GROUP\'${USER_GROUP}'\g' rights.toml
# START THE BOT WITH GIVEN CREDENTIALS
./TS3AudioBot