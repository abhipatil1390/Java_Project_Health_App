
# Stage 2: Use a base image with Java installed
FROM eclipse-temurin:17.0.6_10-jdk

# Set the working directory inside the container
WORKDIR /app2

# Copy the Java application JAR file from the previous stage
#COPY --from=build /app/target/Health_BMI-1.0.0.jar 
COPY . . 
EXPOSE 8000
# Run the Java application when the container starts
CMD ["java", "-jar", "Health_BMI-1.0.0.jar"]
