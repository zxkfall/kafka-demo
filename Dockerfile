# Use the official Eclipse Temurin 17 image as the base image
FROM eclipse-temurin:17-jdk

# Set the working directory inside the container
WORKDIR /usr/src/myapp

# Copy only the Gradle wrapper and settings to leverage Docker cache
COPY gradlew ./
COPY gradle/ gradle/
COPY build.gradle ./
COPY settings.gradle ./

# Make the Gradle wrapper executable
RUN chmod +x gradlew

# Download and cache Gradle dependencies (avoiding cache invalidation)
RUN ./gradlew dependencies || true

# Copy the source code last to leverage Docker cache
COPY src ./src

# Build the application
RUN ./gradlew build

# Run the Spring Boot application
CMD ["./gradlew", "bootRun"]
