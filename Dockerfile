# Use a base image with Java installed
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Java application JAR file to the container
COPY target/Health_BMI-0.0.1-SNAPSHOT.jar /app/Health_BMI-0.0.1-SNAPSHOT.jar

EXPOSE 8000

# Run the Java application when the container starts
CMD ["java", "-jar", "Health_BMI-0.0.1-SNAPSHOT.jar"]
