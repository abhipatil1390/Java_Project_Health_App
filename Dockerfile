FROM eclipse-temurin:17.0.6_10-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the Java application JAR file to the container
COPY . /app
# Expose a port if required
EXPOSE 8000

# Run the Java application when the container starts
CMD ["java", "-jar", "/app/target/Health_BMI-0.0.1-SNAPSHOT.jar"]
