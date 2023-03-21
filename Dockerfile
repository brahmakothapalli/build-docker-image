FROM openjdk:11
EXPOSE 8080
ADD target/build-docker-image.jar build-docker-image.jar
ENTRYPOINT ["java", "-jar", "/build-docker-image.jar"]