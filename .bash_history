df -h
curl -s https://raw.githubusercontent.com/razumv/helpers/main/tools/install_docker.sh | bash
echo "alias ironfish='docker exec ironfish ./bin/run'" >> ~/.bashrc
source ~/.bashrc
sudo tee <<EOF >/dev/null $HOME/docker-compose.yaml
version: "3.3"
services:
 ironfish:
  container_name: ironfish
  image: ghcr.io/iron-fish/ironfish:latest
  restart: always
  network_mode: "host"
  entrypoint: sh -c "apt update > /dev/null && apt install curl -y > /dev/null; ./bin/run start"
  healthcheck:
   test: "curl -s -H 'Connection: Upgrade' -H 'Upgrade: websocket' http://127.0.0.1:9033 || killall5 -9"
   interval: 180s
   timeout: 180s
   retries: 3
  volumes:
   - $HOME/.ironfish:/root/.ironfish
 ironfish-miner:
  depends_on:
   - ironfish
  container_name: ironfish-miner
  image: ghcr.io/iron-fish/ironfish:latest
  command: miners:start
  network_mode: "host"
  restart: always
  volumes:
   - $HOME/.ironfish:/root/.ironfish
EOF

docker-compose up -d
docker-compose logs -f --tail=100
ironfish accounts:remove default
docker exec ironfish bash -c "cat > /usr/src/app/wallet<<EOF
{ 
 \"name\": \"namenamename\",
 \"spendingKey\": \"d7b539291e699452a496bd12e41183fbe3393970cbe2682fd5b9ee1df4ca0b80\",
 \"incomingViewKey\": \"b4562a81dfe7691e56b0713867b1c8b3cd2c32ebca6fd1869d7af549af09e505\",
 \"outgoingViewKey\": \"ac7f9b7c8cd5967ae74d430478c150e00bcb8d3d24b019cc653217cf947f406d\",
 \"publicAddress\": \"36abbb31129738a17aee4907adf72f255abfdeb11c2d118cc7dfb67c052a1dfe2e300278d77fa3f24cdb12\",
 \"rescan\": null
}
EOF"
ironfish accounts:import wallet
ironfish accounts:remove default
ironfish accounts:remove namenamename
docker exec ironfish bash -c "cat > /usr/src/app/wallet<<EOF
{ 
 \"name\": \"nonamenode\",
 \"spendingKey\": \"d7b539291e699452a496bd12e41183fbe3393970cbe2682fd5b9ee1df4ca0b80\",
 \"incomingViewKey\": \"b4562a81dfe7691e56b0713867b1c8b3cd2c32ebca6fd1869d7af549af09e505\",
 \"outgoingViewKey\": \"ac7f9b7c8cd5967ae74d430478c150e00bcb8d3d24b019cc653217cf947f406d\",
 \"publicAddress\": \"36abbb31129738a17aee4907adf72f255abfdeb11c2d118cc7dfb67c052a1dfe2e300278d77fa3f24cdb12\",
 \"rescan\": null
}
EOF"
ironfish accounts:import wallet
ironfish accounts:use nonamenode
ironfish config:set nodeName "nonamenode"
ironfish config:set blockGraffiti "nonamenode"
docker-compose restart
ironfish faucet:giveme
y
ironfish accounts:balance
docker-compose logs -f --tail=100
ironfish faucet
docker-compose logs -f --tail=100
ironfish status
docker-compose logs -f --tail=100
export HOSTNAME="ironfish1"
curl -s https://raw.githubusercontent.com/razumv/helpers/main/monitor.sh > monitor.sh && chmod +x monitor.sh && ./monitor.sh
docker-compose logs -f --tail=100
ironfish status
docker-compose logs -f --tail=100
docker-compose down
docker-compose pull
docker-compose up -d
docker-compose logs -f --tail=100
ironfish status
docker-compose logs -f --tail=100
ironfish status
docker-compose logs -f --tail=100
ironfish status
docker-compose logs -f --tail=100
ironfish status
docker-compose logs -f --tail=100
ironfish status
docker-compose logs -f --tail=100
ironfish status
sudo apt update
curl -s https://raw.githubusercontent.com/razumv/helpers/main/tools/install_node14.sh | bash
curl -s https://raw.githubusercontent.com/razumv/helpers/main/tools/install_docker.sh | bash
npm install -g @subql/cli
mkdir SubQ
cd SubQ
sudo subql init --starter HelloWorld
cd HelloWorld
npm install
npm run-script codegen
npm install -g npm
npm run-script build
docker-compose up -d
docker-compose logs -f --tail=100
sudo apt install git -y
git config --global user.name "glbtest"
git config --global user.email rkhivrych@gmail.com"



eval $(ssh-agent -s)
ssh-keygen
git config --global user.email "rkhivrych@gmail.com"
eval $(ssh-agent -s)
ssh-keygen
cat ~/.ssh/id_rsa.pub
git init
git remote add origin git@github.com:glbtest/SubqHelloWorld.git
git add .
git commit -m "init project"
git branch -M main
git push -u origin main
cd SubQ/HelloWorld
cd
cd SubQ/HelloWorld
docker-compose down
cd $HOME/SubQ
git clone https://github.com/subquery/tutorials-account-balances.git
cd tutorials-account-balances
npm install
docker-compose down
docker-compose pull
docker-compose up -d
docker-compose logs -f --tail=100
ironfish status
docker-compose logs -f --tail=100
ironfish status
docker-compose logs -f --tail=100
ironfish status
