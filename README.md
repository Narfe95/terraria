Creates a docker container based on alpine linux with glibc already compiled into it.
Run container by running 
Replace the world folder: docker run -it -p 7777:7777/tcp -v "/absolute/path/to/world/folder":"/terraria/world" terraria:latest
Replace server.conf and world folder: docker run -it -p 7777:7777/tcp -v "/absolute/path/to/world/folder":"/terraria/world" -v "/absolute/path/to/server.conf":"/terraria/server.conf" terraria:latest

Server.conf example:
maxplayers=8
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

Detach from docker by pressing <ctrl-p> <ctrl-q>
