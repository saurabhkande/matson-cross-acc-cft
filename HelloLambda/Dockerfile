# Use a base image with Java installed
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container
COPY ./target/lambda-java-example-1.0-SNAPSHOT.jar /app/lambda-java-example-1.0-SNAPSHOT.jar

# Specify the command to run the JAR file
CMD ["java", "-jar", "lambda-java-example-1.0-SNAPSHOT.jar"]