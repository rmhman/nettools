#FROM ubuntu:22.04
FROM ubuntu:latest
LABEL author="Ross Heilman" 
RUN mkdir -p /root/.ssh/keys
COPY filemove.sh /root/filemove.sh
COPY apt-install.sh /tmp/apt-install.sh
COPY req-apt.txt /tmp/req-apt.txt
RUN bash /tmp/apt-install.sh
COPY req.txt /tmp/req.txt
COPY req.yml /tmp/req.yml
RUN pipx install --no-cache-dir --upgrade pipx && \
    pipx install --no-cache-dir --upgrade -r /tmp/req.txt  && \
    ansible-galaxy collection install --pre -p /usr/share/ansible/collections -r /tmp/req.yml
RUN apt-get install -f

COPY zsh-in-docker.sh /tmp
RUN /tmp/zsh-in-docker.sh \
    -p git \
    -p python \
    -p aws \
    -p ansible \
    -p ubuntu \
    -p ssh-agent \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-history-substring-search \
    -p https://github.com/zsh-users/zsh-syntax-highlighting 

RUN apt clean && \
      rm -rf /tmp/*

CMD ["/bin/zsh"]
