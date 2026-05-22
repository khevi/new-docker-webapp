#!/bin/bash

docker rm -f myweb 2>/dev/null || true

docker build -t kossi-web .

docker run -d -p 8080:80 --name myweb kossi-web