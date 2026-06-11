FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY webapp/pom.xml .
RUN mvn dependency:go-offline -q
COPY webapp/src ./src
RUN mvn clean package -DskipTests -q

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/webapp-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
