#!/bin/bash
set -e
currentDir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
rootDir="$currentDir/../../"

(cd "$rootDir" && exec ./tools/scripts/clean.sh)
(cd "$rootDir" && exec ./tools/scripts/buildJar.sh)
(cd "$rootDir" && exec ./tools/scripts/buildImage.sh)
(cd "$rootDir" && exec docker compose \
  -f ./tools/docker/docker-compose.yaml \
  --env-file ./tools/docker/env/local.env \
  --project-name=boosty \
  up -d \
  --remove-orphans)

printf 'List of available ports:\n'
(cd "$rootDir" && exec cat ./tools/docker/env/local.env)
