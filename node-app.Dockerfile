FROM alpine as clone
RUN apk fix && \
    apk --no-cache --update add git git-lfs less openssh && \
    git lfs install
RUN git clone --depth 1 https://github.com/kkenan/basic-microservices.git

FROM node:alpine as build
COPY --from=clone /basic-microservices/node-app /node-app
WORKDIR /node-app
RUN npm i

ENTRYPOINT ["node","index.js"]