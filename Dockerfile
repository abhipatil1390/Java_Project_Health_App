# Use a base image with Java installed
FROM openjdk:17

# Set the working directory inside the container
WORKDIR /app

# Copy the Java application JAR file to the container
COPY . /app

# Run the Java application when the container starts
CMD ["java", "-jar", "Health_BMI-0.0.1-SNAPSHOT.jar"]
