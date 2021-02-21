FROM cm2network/steamcmd:latest

USER root

LABEL maintainer="scott.t.lusk@gmail.com"

ENV STEAMAPPID 896660
ENV STEAMAPPDIR /home/steam/valheimserver
ENV STEAMSCRIPTDIR /home/steam/scripts

VOLUME [${STEAMAPPDIR}/Storage]
EXPOSE 3000/udp 3001/tcp

CMD ${STEAMSCRIPTDIR}/steam_update.sh && \
	${STEAMSCRIPTDIR}/configure_server.sh && \
	${STEAMSCRIPTDIR}/start_server.sh

RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
		locales \
		libicu63 \
		libgdiplus \
		jq && \
	sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && locale-gen

ADD src ${STEAMSCRIPTDIR}

RUN ${STEAMSCRIPTDIR}/steam_update.sh
