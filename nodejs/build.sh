if ! command -v podman &> /dev/null
then
  echo "podman could not be found and must not be installed. Please install podman"
  exit
fi
podman build --squash --file ./Containerfile --tag gitea.home/oxa/containers/nodejs
