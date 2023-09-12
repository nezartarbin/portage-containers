if ! command -v podman &> /dev/null
then
  echo "podman could not be found and must not be installed. Please install podman"
  exit
fi
#podman pull docker.io/gentoo/stage3:amd64-openrc
podman build --squash --file Containerfile --tag scala-local-dev
