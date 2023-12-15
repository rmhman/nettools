#! /bin/bash
if [[ $# != 1 ]]; then
  echo -e "\n*** Error: Expecting Container ID as arg. Please run list.sh to find one or run start_latest.sh to start an instance. ***\n"
  exit 1
fi
docker restart $1
if docker exec -u 0 -it "$1" /bin/zsh -l; then
    echo "Have a Nice Day!"
else
    echo "Command failed. Running alternative command..."
    docker exec -u 0 -it "$1" /bin/bash -l
fi

