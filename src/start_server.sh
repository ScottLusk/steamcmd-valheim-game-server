#!/bin/bash

cd ${STEAMAPPDIR}

start /high valheim_server -nographics -batchmode -name "$WORLD_NAME" -port 2456 -world "$WORLD_NAME" -password "$PASSWORD"
