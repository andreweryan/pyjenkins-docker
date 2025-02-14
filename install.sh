#!/bin/bash

docker build -t jenkins-python .
docker run -p 8080:8080 -p 50000:50000 --name jenkins-python jenkins-python

