#!/bin/bash
export HUBOT_LOG_LEVEL="debug"
# export EXPRESS_PORT=8080 
# export HUBOT_BEARYCHAT_MODE=http
export HUBOT_BEARYCHAT_TOKENS=198a4575a9851abdfb8a95e4e28ae76c 
./bin/hubot -a bearychat >> log 2>&1
