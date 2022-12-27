FROM maven:3.8-jdk-11-slim
# springpetclinic
RUN apt update && apt install git -y
RUN git clone https://github.com/spring-projects/spring-petclinic.git
WORKDIR ./spring-petclinic
RUN mvn package
EXPOSE 8080
WORKDIR ./target/
CMD ["java","-jar","spring-petclinic-2.7.3.jar"]

FROM maven:3.8.6-openjdk-11-slim
# open mrs
RUN apt update && apt install git -y
RUN git clone https://github.com/openmrs/openmrs-core.git
WORKDIR ./openmrs-core
RUN mvn clean package
EXPOSE 8080
WORKDIR webapp
CMD ["mvn","jetty:run"]


FROM maven:3.8.6-eclipse-temurin-8-alpine
# game of life
RUN apk update && apk add git
RUN git clone https://github.com/wakaleo/game-of-life.git
WORKDIR ./game-of-life
RUN mvn clean install
WORKDIR /game-of-life/gameoflife-web/
EXPOSE 9090
CMD ["mvn","jetty:run"]
