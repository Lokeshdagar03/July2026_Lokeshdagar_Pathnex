FROM eclipse-temurin:17-jdk

WORKDIR /opt/pathnex/java-app

COPY Hello.java .

RUN javac Hello.java

CMD ["java", "-cp", "/opt/pathnex/java-app", "Hello"]
