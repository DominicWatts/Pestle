# Pestle docker image

[Docker_Hub](https://hub.docker.com/r/domw/pestle)

## Compilation

    docker login

    docker build -t domw/pestle:latest ./

    docker push domw/pestle:latest

    docker build -t domw/pestle:7.1 ./

    docker push domw/pestle:7.1

    docker build -t domw/pestle:latest --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) ./

## Usage
    
    docker pull domw/pestle
    
    docker run --rm -v $PWD:/code domw/pestle:latest
    
## Useage example

    docker run --rm -v $PWD:/code domw/pestle:latest hello-world