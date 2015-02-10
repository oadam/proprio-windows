#install docker
curl -sSL https://get.docker.com/ubuntu/ | sh
gpasswd -a vagrant docker #sudo-less docker

#stop the app
docker stop $(docker ps -q)

#generate secret key
SECRET_KEY="$(docker run oadam/proprio 2>&1|sed -n '23,23 p')"
echo will use secret key: $SECRET_KEY

# start the app
echo -e "\n\nproprio will start now. Once started it will be available on http://192.168.50.60/"
docker run -p 80:8000 -e SECRET_KEY=$SECRET_KEY -e -v /proprio-data:/data oadam/proprio

