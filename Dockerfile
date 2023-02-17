FROM tomcat:9-jdk11-openjdk-slim
COPY target/hello-world.war /usr/local/tomcat/webapps/
