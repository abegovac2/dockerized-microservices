# dockerized-microservices

## Start
#### Docker setup
To setup docker for your sistem, follow instalation form the following links:
* [Docker](https://docs.docker.com/get-docker/)
* [Docker compose](https://docs.docker.com/compose/install/)

Or install [Docker desktop](https://www.docker.com/products/docker-desktop/)

#### Build

Inside the root folder run this command:

```
docker compose up --build
```

If the docker runtime and docker compose were setup correctly, the app should start.

To check if containers are up and running, run script: 

```
./test.sh
```
