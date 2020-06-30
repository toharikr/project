FROM maven:3.6.0-jdk-11-slim AS build
COPY src /Users/dharanianimireddy/project/src
COPY pom.xml /Users/dharanianimireddy/project
RUN mvn -f /Users/dharanianimireddy/project/pom.xml clean package

FROM openjdk:8-jdk-alpine
COPY --from=build /Users/dharanianimireddy/project/target/gs-spring-boot-docker-0.1.0.jar /usr/local/lib/project.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/project.jar"]
