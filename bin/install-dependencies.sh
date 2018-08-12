sudo service postgresql stop

sudo apt-get update
sudo apt-get install -o Dpkg::Options::="--force-confold" --force-yes -y docker-ce

sudo rm /usr/local/bin/docker-compose
curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose
chmod +x docker-compose
sudo mv docker-compose /usr/local/bin
