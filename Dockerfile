FROM eclipse-temurin:17-jdk-alpine
# FROM openjdk:8-jre-alpine

EXPOSE 8080

COPY ./target/java-maven-app-*.jar /usr/app/
WORKDIR /usr/app

CMD java -jar java-maven-app-*.jar




    


# CMD ["java", "-jar", "app.jar"]