FROM cm2network/steamcmd:latest

USER root

LABEL maintainer="scott.t.lusk@gmail.com"

ENV STEAMAPPID 896660
ENV STEAMAPPDIR /home/steam/valheimserver
ENV STEAMSCRIPTDIR /home/steam/scripts

ENV WORLD_NAME hello_world
ENV PASSWORD password

VOLUME [${STEAMAPPDIR}/Storage]
EXPOSE 2456-2458

CMD ${STEAMSCRIPTDIR}/steam_update.sh && \
	${STEAMSCRIPTDIR}/configure_server.sh && \
	${STEAMSCRIPTDIR}/start_server.sh

RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
		locales \
		libicu63 \
		libgdiplus \
		libsdl2-2.0-0 \
		jq && \
	sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && locale-gen

ADD --chown=steam:steam --chmod=777 src ${STEAMSCRIPTDIR}

RUN ${STEAMSCRIPTDIR}/steam_update.sh
