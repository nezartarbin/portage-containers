if ! command -v podman &> /dev/null
then
  echo "podman could not be found and must not be installed. Please install podman"
  exit
fi
podman build --squash --file "./${1}/Containerfile" --tag "gitea.home/oxa/containers/${1}"
podman push "gitea.home/oxa/containers/${1}"
