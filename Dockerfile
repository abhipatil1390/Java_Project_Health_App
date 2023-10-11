FROM maven:3.9.0-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mvn clean install

# Use a base image with Java installed
FROM eclipse-temurin:17.0.6_10-jdk

# Set the working directory inside the container
WORKDIR /app
COPY . /app/
# Copy the Java application JAR file to the container
RUN chmod +x /app/target/Health_BMI-1.0.0.jar

EXPOSE 8000

# Run the Java application when the container starts
CMD ["java", "-jar", "/app/Health_BMI-1.0.0.jar"]
