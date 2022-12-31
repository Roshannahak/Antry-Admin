FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y git curl unzip

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

ENV PATH="${PATH}:/usr/local/flutter/bin"

RUN flutter doctor

RUN flutter config --enable-web

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN flutter build web

EXPOSE 3232

RUN chmod +x /server/server.sh

CMD [ "/server/server.sh" ]