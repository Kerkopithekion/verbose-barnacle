#!/bin/bash

# Remove running containers if any
containers=$(docker ps -q)
if [ -n "$containers" ]; then
  docker rm -f $containers
else
  echo "No running containers to remove."
fi

# Remove images if any
images=$(docker images -q)
if [ -n "$images" ]; then
  docker rmi -f $images
else
  echo "No images to remove."
fi

# Remove volumes if any
volumes=$(docker volume ls -q)
if [ -n "$volumes" ]; then
  docker volume rm -f $volumes
else
  echo "No volumes to remove."
fi
