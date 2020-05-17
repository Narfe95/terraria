Creates a docker container based on alpine linux with glibc already compiled into it.
# Terraria docker container

## Building the container
1. Pull this repository
1. Change directory to the repository
1. Build using: `docker build -t terraria:latest .`

## Running the container
Run container by running
Replace the world folder: `docker run -it -p 7777:7777/tcp -v "/absolute/path/to/world/folder":"/terraria/world" terraria:latest`
Replace server.conf and world folder: `docker run -it -p 7777:7777/tcp -v "/absolute/path/to/world/folder":"/terraria/world" -v "/absolute/path/to/server.conf":"/terraria/server.conf" terraria:latest`

## Terraria server.conf config example
`maxplayers=8
world=/terraria/world/docker.wld
port=7777
password=
motd=Hosted in a docker container
worldpath=/terraria/world/
autocreate=2
difficulty=0
worldname=docker
banlist=banlist.txt
secure=1
language=en/US
seed=
upnp=1
npcstream=60
priority=1
# Journey mode power permissions for every individual power. 0: Locked for everyone, 1: Can only be changed by host, 2: Can be changed by everyone
journeypermission_time_setfrozen=1
journeypermission_time_setdawn=1
journeypermission_time_setnoon=1
journeypermission_time_setdusk=1
journeypermission_time_setmidnight=1
journeypermission_godmode=1
journeypermission_wind_setstrength=1
journeypermission_rain_setstrength=1
journeypermission_time_setspeed=1
journeypermission_rain_setfrozen=1
journeypermission_wind_setfrozen=1
journeypermission_increaseplacementrange=1
journeypermission_setdifficulty=1
journeypermission_biomespread_setfrozen=1
journeypermission_setspawnrate=1`

Detach from docker by pressing `<ctrl-p> <ctrl-q>`
