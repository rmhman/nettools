FROM ubuntu:22.04

LABEL author="Ross Heilman"

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Correct the COPY command to place filemove.sh in /root instead of /tmp
COPY filemove.sh /root/filemove.sh
COPY apt-install.sh req-apt.txt req.txt req.yml zsh-in-docker.sh /tmp/

# Use SHELL for better readability
SHELL ["/bin/bash", "-c"]

# Combine RUN commands to reduce layers and include directory creation
RUN mkdir -p /root/.ssh/keys && \
    apt-get update && \
    bash /tmp/apt-install.sh && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --upgrade -r /tmp/req.txt && \
    ansible-galaxy collection install --pre -p /usr/share/ansible/collections -r /tmp/req.yml && \
    apt-get install -f -y && \
    /tmp/zsh-in-docker.sh \
    -p git \
    -p python \
    -p aws \
    -p ansible \
    -p ubuntu \
    -p ssh-agent \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-history-substring-search && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Set default shell
CMD ["/bin/zsh"]