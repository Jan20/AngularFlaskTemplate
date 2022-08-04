#!/bin/sh

build_flask() {
    echo "Building the Flask app"
    cd Flask
    docker build -t flask_introduction:latest .
    cd ..
}

build_angular() {
    echo "Building the Angular app"
    cd Angular
    docker build -t angular_introduction:latest .
    cd ..
}

start_all() {
    docker-compose -f docker-compose.yml up -d
}

stop() {
    docker-compose -f docker-compose.yml down
}

remove() {
    docker-compose -f docker-compose.yml down
    docker image rm angular_introduction
    docker image rm flask_introduction
}

toLower() {
    echo $(echo  ${@} | tr '[:upper:]' '[:lower:]')
}

COMMAND=$(toLower ${1})

case "${COMMAND}" in
    "build")
        build_flask
        build_angular
    ;;
    "start")
        start_all
    ;;
    "stop")
        stop
    ;;
    "remove")
        remove
    ;;
esac