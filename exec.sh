#! /bin/bash

if [[ $# != 1 ]]; then
  echo -e "\n*** Error: Expecting Container ID as arg. Please run list.sh to find one or run start_latest.sh to start an instance. ***\n"
  exit 1
fi

docker exec -u 0 -it $1 /bin/bash -l
