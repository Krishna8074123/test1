 FROM maven:3.8.6-eclipse-temurin-11
 RUN git clone https://github.com/spring-projects/spring-petclinic.git
 WORKDIR ./spring-petclinic
 EXPOSE 8080
 RUN mvn package
 WORKDIR ./target/
 CMD ["java","-jar","spring-petclinic-2.7.3.jar"]
