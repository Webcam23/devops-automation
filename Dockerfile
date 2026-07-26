FROM openjdk:8-jdk
EXPOSE 8080
ADD target/devops-integration.jar devops-integration.jar
ENTRYPOINT ["java", "-jar", "devops-integration.jar"]