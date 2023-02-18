FROM maven:3.8.1-jdk-11 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package

FROM openjdk:11-jre-slim
COPY --from=build /app/target/my-app-1.0-SNAPSHOT.jar /app.jar
EXPOSE 8081
CMD ["java", "-jar", "/app.jar"]


