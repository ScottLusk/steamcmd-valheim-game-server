# steamcmd-valheim-game-server
An Valheim Game Server based on SteamCMD

## Ports 
- `2456/2457 UDP`
  - Valheim Game Server

## Volumes
- /home/steam/valheimserver
  - Mount this volume to persist the server game files storage

## Updates
Restarting the docker container will update the game server automatically through Steam.

## Server Configuration
Here are some environment variables you may pass into the container that will allow you to change the game server's settings. Please open an issue if you'd like more added.

- `WORLD_NAME` 
  - String
  - Default `CHANGEME`
  - Mapped to name and world
- `PASSWORD` 
  - String
  - Default ``
  - Mapped to password