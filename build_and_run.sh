#!/bin/sh
set -e

# build
docker build -t fubotv/kg-pgpool .

# run if build succeeds, bind to first network interface
# need to experiment with --net-host
docker run --rm --name pgpool -e PGPOOL_BACKENDS=1:$(ipconfig getifaddr en0):5432 -it -p 9999:5432/tcp fubotv/kg-pgpool
