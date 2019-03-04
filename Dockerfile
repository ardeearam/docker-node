FROM ubuntu:18.04 
ENV NODE_VERSION 9.11.0
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

# Create runner wrapper
COPY runner.sh /tmp/runner.sh
RUN chmod +x /tmp/runner.sh


ENTRYPOINT ["/tmp/runner.sh", "node"]
CMD ["-v"]
