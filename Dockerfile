FROM maven:3.6.0-jdk-11-slim AS build
COPY src /Users/dharanianimireddy/demoazure/src
COPY pom.xml /Users/dharanianimireddy/demoazure
RUN mvn -f /Users/dharanianimireddy/demoazure/pom.xml clean package

FROM openjdk:8-jdk-alpine
COPY --from=build /Users/dharanianimireddy/demoazure/target/gs-spring-boot-docker-0.1.0.jar /usr/local/lib/demoazure.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/demoazure.jar"]
