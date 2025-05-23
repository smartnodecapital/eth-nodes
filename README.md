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

### If not running mainnet edit .env files
```bash
  cd /opt/eth
  sudo cp el/example.env el/.env
  sudo cp cl/example.env cl/.env
  sudo cp mev/example.env mev/.env
```
* sudo nano el/.env
* sudo nano cl/.env
* sudo nano mev/.env

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
sudo docker compose logs -f
add --tail=10 to start at the end 

## Firewall
```bash
sudo ufw allow 9000
sudo ufw allow 30303

# erigon sudo ufw allow 42068
```

## config clients

### consensus / Beacon node / ETH2
```
http://consensus:5052
```

### execution / ETH1
```
ws://execution:8546
http://execution:8545
```