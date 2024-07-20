FROM openjdk:21-jdk

WORKDIR /app

COPY ./build/libs/*.jar app.jar

# use with postgres: ENTRYPOINT [ "./docker-entrypoint.sh" ]
CMD ["java", "-jar", "./app.jar"]
