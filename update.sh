#!/bin/sh
set -e  # Exit immediately if a command fails

cd /opt/eth

SERVICE=${1:-all}  # Default to "all" if no argument is given

stop_and_update() {
  name=$1
  echo ">>> Stopping $name..."
  cd "$name"
  docker compose down
  cd ..
}

pull_and_start() {
  name=$1
  echo ">>> Starting $name..."
  cd "$name"
  docker compose pull
  docker compose up -d
  cd ..
}

# Stop selected services
case "$SERVICE" in
  el)
    stop_and_update el
    ;;
  cl)
    stop_and_update cl
    ;;
  mev)
    stop_and_update mev
    ;;
  all)
    stop_and_update el
    stop_and_update cl
    stop_and_update mev
    ;;
  *)
    echo "Invalid parameter: $SERVICE"
    echo "Usage: $0 [el|cl|mev|all]"
    exit 1
    ;;
esac

# Pull latest code
cd /opt/eth
git pull

# Start selected services
case "$SERVICE" in
  el)
    pull_and_start el
    ;;
  cl)
    pull_and_start cl
    ;;
  mev)
    pull_and_start mev
    ;;
  all)
    pull_and_start el
    pull_and_start cl
    pull_and_start mev
    ;;
esac

echo ">>> Done!"
