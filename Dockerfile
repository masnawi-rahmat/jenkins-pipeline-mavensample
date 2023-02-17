# Use an official Maven runtime as a parent image
FROM maven:3.8.3-openjdk-17-slim AS build

# Set the working directory to /app
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml .

# Download dependencies specified in pom.xml and cache them
RUN mvn dependency:go-offline -B

# Copy the rest of the application code to the container
COPY src/ /app/src/

# Build the application using Maven
RUN mvn package

# Start with a lightweight base image
FROM openjdk:17-slim

# Set the working directory to /app
WORKDIR /app

# Copy the JAR file built in the previous stage to the container
COPY --from=build /app/target/my-app-*.jar /app/my-app.jar

# Expose port 8000
EXPOSE 8000

# Start the application
CMD ["java", "-jar", "my-app.jar"]
