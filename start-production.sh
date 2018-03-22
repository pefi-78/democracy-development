#!/bin/bash
echo "### Start git process ###"

echo "# git fetch #"
git fetch
echo "# git pull #"
git pull
echo "# git submodule update --init --recursive #"
git submodule update --init --recursive
echo "# git status #"
git status

echo "### Start docker Process ###"
echo "# docker-compose up -d --build $@"
docker-compose up -f docker-compose.yml -f docker-compose.prod.yml -d --build $@
