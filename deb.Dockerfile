FROM debian:9

RUN apt-get update
RUN apt-get -y install openjdk-8-jre
RUN apt-get -y install ssh
COPY authorized_keys /etc
