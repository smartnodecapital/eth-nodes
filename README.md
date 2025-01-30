# eth-nodes
Docker setup Ethereum nodes

## Usage

## install docker
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

### make jwt.hex
```bash
sudo mkdir -p /data/jwtsecret
openssl rand -hex 32 | sudo tee /data/jwtsecret/jwt.hex > /dev/null
```


### init commands
```bash
  sudo git clone https://github.com/smartnodecapital/eth-nodes.git /opt/eth
  cd /opt/eth
  sudo cp el/docker-compose.override.example.yml el/docker-compose.override.yml
  sudo cp cl/docker-compose.override.example.yml cl/docker-compose.override.yml
```
### edit overrides with correct clients
comment out the client wanted (name & profile)
* sudo nano el/docker-compose.override.yml
* sudo nano cl/docker-compose.override.yml

### Erigon
make /data/erigon user 1000:1000
```bash
sudo chown 1000:1000 /data/erigon
```

### start commands
```bash
  cd /opt/eth/el
  sudo docker compose up -d
  cd /opt/eth/cl
  sudo docker compose up -d
  cd /opt/eth/mev
  sudo docker compose up -d
```
### monitor containers
```bash
sudo docker logs -f --details el-execution-1
sudo docker logs -f --details cl-consensus-1
sudo docker logs -f --details mev-mev-boost-1
```
add --tail=10 to start at the end 

## Firewall
```bash
sudo ufw allow 9000
sudo ufw allow 30303

# erigon sudo ufw allow 42068
```