# eth-nodes
Docker setup Ethereum nodes

## Usage
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