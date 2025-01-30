# eth-nodes
Docker setup Ethereum nodes

## Usage
### init commands
```bash
  git clone https://github.com/smartnodecapital/eth-nodes.git /opt/eth
  cd /opt/eth
  cp el/docker-compose.override.example.yml el/docker-compose.override.yml
  cp cl/docker-compose.override.example.yml cl/docker-compose.override.yml
```
### edit overrides with correct clients
comment out the client wanted (name & profile)
* nano el/docker-compose.override.yml
* nano cl/docker-compose.override.yml
### start commands
```bash
  cd /opt/eth/el
  docker compose up -d
  cd /opt/eth/cl
  docker compose up -d
  cd /opt/eth/mev
  docker compose up -d
```
### monitor containers
```bash
docker logs -f --details el-execution-1
docker logs -f --details cl-consensus-1
docker logs -f --details mev-mev-boost-1
```
add --tail=10 to start at the end 