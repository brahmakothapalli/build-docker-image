FROM openjdk:11
EXPOSE 8080
ADD target/buil-docker-image.jar buil-docker-image.jar
ENTRYPOINT ["java", "-jar", "/buil-docker-image.jar"]