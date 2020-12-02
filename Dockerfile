FROM openjdk:8 AS build
COPY . /usr/src/app
WORKDIR /usr/src/app
CMD ["./mvnw", "package"]

FROM openjdk:8
WORKDIR /root
COPY --from=build /usr/src/app/target/spring-petclinic-1.0.jar .
CMD ["java", "-jar", "./spring-petclinic-1.0.jar"]
