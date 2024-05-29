# Use an official lightweight Alpine Linux as a base image for ARM64
FROM --platform=linux/arm64 alpine:latest

# Set build arguments for Ansible versions
ARG ANSIBLE_CORE_VERSION=2.16.4
ARG ANSIBLE_VERSION=9.2.0

# Install dependencies
RUN apk update && \
    apk add --no-cache \
    python3 \
    py3-pip \
    python3-dev \
    openssl \
    ca-certificates \
    sshpass \
    rsync \
    git \
    build-base \
    libffi-dev \
    openssl-dev

# Create a directory for the virtual environment
RUN mkdir -p /ansible/venv

# Create a virtual environment and activate it
RUN python3 -m venv /ansible/venv

# Upgrade pip and install specified versions of Ansible within the virtual environment
RUN /ansible/venv/bin/pip install --upgrade pip && \
    /ansible/venv/bin/pip install --upgrade cryptography cffi && \
    /ansible/venv/bin/pip install ansible-core==${ANSIBLE_CORE_VERSION} && \
    /ansible/venv/bin/pip install ansible==${ANSIBLE_VERSION}

# Set the PATH to include the virtual environment
ENV PATH="/ansible/venv/bin:$PATH"

# Set the working directory
WORKDIR /ansible

# RUN mkdir -p /etc/ansible && \
#     echo 'localhost' > /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]