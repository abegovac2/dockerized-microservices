FROM alpine as clone
RUN apk fix && \
    apk --no-cache --update add git git-lfs less openssh && \
    git lfs install
RUN git clone --depth 1 https://github.com/kkenan/basic-microservices.git

FROM maven:3-alpine as build
COPY --from=clone /basic-microservices/spring-boot-app /spring-boot-app
WORKDIR /spring-boot-app
RUN mvn clean package

FROM openjdk:8-alpine as publish
COPY --from=build /spring-boot-app/target /target

ENTRYPOINT java -jar target/spring-boot-app-1.0-SNAPSHOT.jar