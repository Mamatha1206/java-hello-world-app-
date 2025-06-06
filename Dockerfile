# Use Maven to build the application
FROM maven:3.8.8-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Run the application
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/java-hello-world-app-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
