FROM java:8u111-jre-alpine
LABEL maintainer="Daniele Monteleone <daniele@monteleone.ml>"

WORKDIR /opt/ftb
ADD https://addons.cursecdn.com/files/2435/268/FTBPresentsDirewolf20110Server_1.12.1.zip .
RUN apk add --no-cache zip openssl && \
  unzip FTBPresentsDirewolf20110Server_1.12.1.zip && \
  chmod +x *.sh && \
  rm FTBPresentsDirewolf20110Server_1.12.1.zip
RUN ./FTBInstall.sh && \
  echo "eula=true" > eula.txt
ADD server.properties .
ADD config.json ./local/ftbu

VOLUME [ "/opt/ftb/world", "/opt/ftb/backups" ]

EXPOSE 25565

CMD ./ServerStart.sh
