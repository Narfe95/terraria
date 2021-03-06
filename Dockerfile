FROM frolvlad/alpine-glibc

ARG version_number=1423
ARG download_url=https://terraria.org/system/dedicated_servers/archives/000/000/046/original/terraria-server-1423.zip

RUN apk update && \
apk add wget && \
mkdir /terraria && \
cd /terraria && \
wget ${download_url} && \
unzip terraria-server-${version_number}.zip && \
mv ${version_number}/Linux/* ./ && \
rm -rf ${version_number} terraria-server-${version_number}.zip && \
chmod u+x TerrariaServer.bin.x86_64 && \
mkdir /terraria/world

EXPOSE 7777/tcp
COPY files/server.conf /terraria/
COPY files/start_server.sh /
HEALTHCHECK --interval=3s --timeout=1s --start-period=15s --retries=100 CMD /usr/bin/nc -z localhost 7777
ENTRYPOINT [ "/start_server.sh" ]
