# Stage 1 - Build

FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /opt/pathnex/java-build

COPY . .

RUN mvn clean package

# Stage 2 - Runtime

FROM tomcat:9

WORKDIR /usr/local/tomcat/webapps

COPY --from=builder /opt/pathnex/java-build/target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
