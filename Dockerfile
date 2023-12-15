#FROM ubuntu:22.04
FROM ubuntu:latest
LABEL author="Ross Heilman" 
COPY apt-install.sh /tmp/apt-install.sh
COPY req-apt.txt /tmp/req-apt.txt
RUN bash /tmp/apt-install.sh
COPY req.txt /tmp/req.txt
COPY req.yml /tmp/req.yml
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --upgrade -r /tmp/req.txt  && \
    ansible-galaxy collection install --pre -p /usr/share/ansible/collections -r /tmp/req.yml
RUN apt-get install -f
RUN apt clean && \
      rm -rf /tmp/*
RUN echo 'alias ll="ls -lAtch"' >> ~/.bashrc
CMD ["/bin/bash"]
