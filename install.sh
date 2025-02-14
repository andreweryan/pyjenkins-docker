#!/bin/bash

sudo groupadd -f docker
sudo usermod -aG docker $USER
newgrp docker

docker build -t jenkins-python .
docker run -p 8080:8080 -p 50000:50000 jenkins-python
