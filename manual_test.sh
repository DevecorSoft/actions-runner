set -e
version=$(date +%Y%m%d%H%M%S)
tag=test/actions-runner:$version
docker buildx build --platform linux/amd64 --load \
  -t $tag \
  .
docker run -it --rm $tag bash
