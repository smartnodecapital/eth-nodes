#!/bin/sh

cd /opt/eth
cd el
docker compose down
cd ../cl
docker compose down
cd ../mev
docker compose down

cd ..
git pull

cd el
docker compose pull && docker compose up -d
cd ../cl
docker compose pull && docker compose up -d
cd ../mev
docker compose pull && docker compose up -d
