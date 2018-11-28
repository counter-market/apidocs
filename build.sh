#!/bin/bash
set -x

docker-compose run app bundle exec middleman build --clean
cp -R source/images build/
cp -R build/ docs/