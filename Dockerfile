# Use a base image with Java installed
FROM eclipse-temurin:17.0.6_10-jdk

# Set the working directory inside the container
WORKDIR /app2

# Copy the Java application JAR file to the container
COPY . /app2

EXPOSE 8000

# Run the Java application when the container starts
CMD ["java", "-jar", "/tartget/Health_BMI-1.0.0.jar"]
