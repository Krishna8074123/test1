FROM maven:3.8.6-eclipse-temurin-8-alpine
# game of life
RUN apk update && apk add git
RUN git clone https://github.com/wakaleo/game-of-life.git
WORKDIR ./game-of-life
RUN mvn clean install
WORKDIR /game-of-life/gameoflife-web/
EXPOSE 9090
CMD ["mvn","jetty:run"]
