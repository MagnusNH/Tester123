#!/bin/bash
set -e
docker volume create minvolume
docker run --rm -v minvolume:/data alpine sh -c "echo 'Hej fra volume!' > /data/besked.txt"
docker run --rm -v minvolume:/data alpine cat /data/besked.txt
docker run --rm alpine cat /data/besked.txt || echo "Uden volume: filen findes ikke (som forventet)"
docker run -d --name minside-vol -v minvolume:/data minside
docker exec minside-vol sh -c "echo 'Besked fra mit eget image!' > /data/minside-fil.txt"
docker rm -f minside-vol
docker run --rm -v minvolume:/data alpine cat /data/minside-fil.txt

