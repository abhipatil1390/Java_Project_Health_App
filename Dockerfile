# Stage 1: Build the Java application with Maven
FROM maven:3.9.0-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mvn clean install
# Set execute permissions on the JAR file
RUN chmod +x /app/target/*.jar

# Stage 2: Use a base image with Java installed
FROM eclipse-temurin:17.0.6_10-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the Java application JAR file to the container
COPY --from=build /app/target/*.jar  /app/target/Health_BMI-1.0.0.jar

# Expose a port if required
EXPOSE 8000

# Run the Java application when the container starts
CMD ["java", "-jar", "Health_BMI-1.0.0.jar"]
