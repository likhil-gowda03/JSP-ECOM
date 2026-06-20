# Stage 1: Build the Java application using Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy the pom.xml and source code
COPY JSP-Ecom-Application-main/pom.xml ./JSP-Ecom-Application-main/
COPY JSP-Ecom-Application-main/src ./JSP-Ecom-Application-main/src

# Set working directory to project root and build the WAR file
WORKDIR /app/JSP-Ecom-Application-main
RUN mvn clean package -DskipTests

# Stage 2: Deploy to Tomcat
FROM tomcat:9.0.87-jdk17-temurin

# Remove default ROOT application to deploy ours at the root domain context (/)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the WAR file compiled in Stage 1 and rename it to ROOT.war
COPY --from=build /app/JSP-Ecom-Application-main/target/test-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose default Tomcat port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
