#!/bin/bash
# export HUBOT_LOG_LEVEL="debug"
EXPRESS_PORT=8080 HUBOT_BEARYCHAT_TOKENS=198a4575a9851abdfb8a95e4e28ae76c ./bin/hubot -a bearychat > log 2>&1
