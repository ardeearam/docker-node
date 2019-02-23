FROM ubuntu:18.04 
ENV NODE_VERSION 11.10.0
ENV NVM_VERSION v0.34.0

ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Replace shell with bash so we can source files
SHELL ["/bin/bash", "-l",  "-c"] 

# Install OS-level dependencies, use PH mirror for faster builds
RUN sed --in-place --regexp-extended "s/(archive\.ubuntu\.com)/mirror.rise.ph/" /etc/apt/sources.list && \
    sed --in-place --regexp-extended "s/(security\.ubuntu\.com)/mirror.rise.ph/" /etc/apt/sources.list && \
    apt-get update &&\
    apt-get install -y curl

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash

# Install NODE
RUN source /root/.nvm/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm use $NODE_VERSION;

COPY wrapper.sh /tmp/wrapper.sh
RUN chmod +x /tmp/wrapper.sh


ENTRYPOINT ["/tmp/wrapper.sh", "node"]
CMD ["-v"]
