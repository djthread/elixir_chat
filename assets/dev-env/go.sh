#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
docker-compose -f "$DIR/docker-compose.yml" run --rm -p 4000:4000 dev
