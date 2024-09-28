# Use Maven to build the application
FROM maven:3.8.7 AS build


COPY pom.xml ./pom.xml
COPY src ./src


RUN mvn clean package 


FROM openjdk:8-alpine


COPY --from=build target/*.jar app.jar


EXPOSE 8080


ENTRYPOINT ["java", "-jar", "app.jar"]
