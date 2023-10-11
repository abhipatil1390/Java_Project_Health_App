FROM eclipse-temurin:17.0.6_10-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the Java application JAR file to the container
COPY . .
RUN chmod +wrx /target/*.jar
# Expose a port if required
EXPOSE 8000

# Run the Java application when the container starts
CMD ["java", "-jar", "*.jar"]
