FROM openjdk:8-jre-alpine

COPY target/my-app-1.0-SNAPSHOT.jar /app.jar

CMD ["java", "-jar", "/app.jar"]

EXPOSE 8080

