## QUICK START: TL;DR
This will get your container up and running:

```docker run -it --rm --name nettools -v $PWD/shared:/shared rmheilman/nettools:2.2 /bin/zsh```

**Note:** You will want to make sure you have a folder named `shared` in the directory you are running the `docker run` command from. Or, remove `-v $PWD/shared:/shared` from the command above.

**Other Note:** Remove `--rm` from the above command if you want the container to remain after exiting; otherwise, it will be destroyed.

# Network Tools Container

This Docker container provides a collection of base Linux tools and automation tools for network operations. It includes popular Linux tools such as cron, curl, gcc, git, iperf, ipmitool, and many more. Additionally, it includes Python packages like ncclient, ansible, pyats, and various others.


## Shared Folder

The repository includes a shared folder that will be mapped to the container's shared folder. This allows for easy movement and sharing of folders and files between the container-host and the container itself.

## Usage
Ensure you have Docker installed and configured before using this network tools container.

**Note:** Replace <container_name> with the desired name for your container.

1. Clone the repository.
2. Run `./build.sh` to build the Docker image.
3. Run `./start.sh <container_name>` to create the container and map the shared folder.
4. Use the provided bash scripts (`exec.sh`, `restart.sh`) to manage and interact with the running container.

## Bash Scripts

The repository includes several bash scripts to simplify container management:

- `./build.sh`: Builds the Docker image with the tag `nettools:2.2`.
- `./exec.sh <container_name>`: Gets you into an already running container and puts you into a zsh prompt. 
- `./restart.sh <container_name>`: Restarts the container and executes you in it. 
- `./start.sh <container_name>`: Must be run first; it creates the container and maps the shared folder. 

Feel free to modify and customize these scripts as per your specific needs.


## Linux Tools Included

- cron
- curl
- gcc
- git
- iperf
- ipmitool
- iputils-ping
- jq
- libffi-dev
- libssl-dev
- libxslt1-dev
- make
- net-tools
- netcat
- nmap
- plocate
- python-is-python3
- python3
- python3-dev
- python3-pip
- python3-setuptools
- sshpass
- tcpdump
- telnet
- traceroute
- vim
- zsh

## Python Packages Included

- ansible
- cffi
- ciscoconfparse
- genie
- jmespath
- lxml
- napalm
- napalm-ansible
- ncclient
- netaddr
- netmiko
- networklab
- nornir
- nornir-napalm
- ntc-templates
- objectpath
- paramiko
- ptf
- pyats[full]
- pylint
- pynetbox
- pytest
- requests
- scapy
- scp
- textfsm
- ttp
- urllib3
- yamllint
- yapf
- yq

## Ansible Galaxy Collections

- cisco.asa
- cisco.nxos
- cisco.ios
- cisco.iosxr
- arista.eos
- f5networks.f5_modules
- paloaltonetworks.panos
- community.general

For any questions or issues, please open an issue in the repository.

**-Special Note:** Run `p10k configure` to configure your prompt inside the container.

**Happy Networking!**
