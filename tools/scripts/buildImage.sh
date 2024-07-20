#!/bin/bash
set -e
currentDir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
rootDir="$currentDir/../../"

imageTag=$1

if [ -z "$1" ]
  then
    echo 'No imageTag provided. Latest will be used.'
    imageTag=latest
fi

imageFullName=spring-interview-tx-bayan:$imageTag

echo [BOOSTY STARTING] building "$imageFullName"...

echo [BOOSTY] remove old image "$imageFullName"...

# Check if the image exists before attempting to remove it
if docker images -q "$imageFullName" &> /dev/null; then
  echo [BOOSTY] remove old image "$imageFullName"...
  docker rmi -f "$imageFullName"
fi

echo [BOOSTY] creating docker image "$imageFullName"...
(docker build -f "${rootDir}/Dockerfile" -t "$imageFullName" "$rootDir")

echo [BOOSTY FINISHED] image "$imageFullName" has been built
