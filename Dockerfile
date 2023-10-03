FROM maven:3.9.0-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mvn clean install

# Use a base image with Java installed
FROM openjdk:17

# Set the working directory inside the container
WORKDIR /app

# Copy the Java application JAR file to the container
COPY COPY --from=build /app/target/demoapp.jar /app/

EXPOSE 8000

# Run the Java application when the container starts
CMD ["java", "-jar", "demoapp.jar"]
