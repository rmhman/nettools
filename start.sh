#! /bin/bash
if [[ $# != 1 ]]; then
  echo -e "\n*** Error: Expecting Container name as arg. Please add a name to your container after ./start.sh. ***\n"
  exit 1
fi

docker run --name $1  -v $PWD/shared:/shared -it rmheilman/nettools /bin/zsh -l
