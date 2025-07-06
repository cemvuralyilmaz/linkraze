# Use a Java 20 JDK image to build the Spring Boot app
FROM eclipse-temurin:20 AS build

# Set the working directory
WORKDIR /app

# Copy Maven Wrapper files first
COPY mvnw ./
COPY .mvn ./.mvn

# Make mvnw executable
RUN chmod +x ./mvnw

# Copy the pom.xml and install dependencies
COPY pom.xml ./
RUN ./mvnw dependency:go-offline

# Copy the source code and build the application
COPY src ./src
RUN ./mvnw clean package -DskipTests

# Use a Java 20 runtime image to run the application
FROM eclipse-temurin:20-jre

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Specify the command to run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]