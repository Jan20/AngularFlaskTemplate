#!/bin/sh

# Getting the script's path
SCRIPT_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

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

# 
toLower() {
    echo $(echo  ${@} | tr '[:upper:]' '[:lower:]')
}

pushd ${SCRIPT_HOME} >/dev/null
COMMAND=$(toLower ${1})
shift || COMMAND=usage

case "${COMMAND}" in
    "build")
        build_flask
        build_angular
    ;;
    "start")
        start_all
    ;;
esac