#!/bin/bash

cd ${STEAMAPPDIR}

./valheim_server.x86_64 -nographics -batchmode -savedir "~/valheimserver/Storage" -name "$WORLD_NAME" -port 2456 -world "$WORLD_NAME" -password "$PASSWORD"
