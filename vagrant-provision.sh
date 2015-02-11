#!/bin/bash

#install docker if needed
which docker || (curl -sSL https://get.docker.com/ubuntu/ | sh)
#sudo-less docker
gpasswd -a vagrant docker

#stop the app
docker stop $(docker ps -q)

#generate secret key
SECRET_KEY="$(docker run oadam/proprio 2>&1|sed -n '23,23 p')"
echo will use secret key: "$SECRET_KEY"

# start the app
echo -e "\n\nproprio will start now. Once started it will be available on http://192.168.50.60/"
docker run -p 80:8000 -e SECRET_KEY="$SECRET_KEY" -v /proprio-data:/data oadam/proprio

