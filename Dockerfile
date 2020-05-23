FROM frolvlad/alpine-glibc

ARG download_url=https://www.terraria.org/system/dedicated_servers/archives/000/000/038/original/terraria-server-1404.zip
ARG version_number=1404

RUN apk update && apk add wget && mkdir /terraria && cd /terraria && wget ${download_url} && unzip terraria-server-${version_number}.zip && mv ${version_number}/Linux/* ./ && rm -rf ${version_number} terraria-server-${version_number}.zip && chmod u+x TerrariaServer.bin.x86_64 && mkdir /terraria/world

EXPOSE 7777/tcp
COPY files/server.conf /terraria/
COPY files/start_server.sh /
ENTRYPOINT [ "/start_server.sh" ]
