#install docker
curl -sSL https://get.docker.com/ubuntu/ | sh
gpasswd -a vagrant docker #sudo-less docker

#install utilities
apt-get install -y curl

#generate secret key
SECRET_KEY="$(docker run oadam/proprio 2>&1|sed -n '23,23 p')"
echo will use secret key: $SECRET_KEY

# start the app
docker run -d -p 80:8000 -e SECRET_KEY=$SECRET_KEY -v /proprio-data:/data oadam/proprio
