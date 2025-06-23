# Test environment for chezmoi dotfiles
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/root
ENV SHELL=/bin/bash

# Install essential packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    zsh \
    sudo \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install chezmoi
RUN sh -c "$(curl -fsLS https://www.chezmoi.io/get)" -- -b /usr/local/bin

# Set default shell to zsh
RUN chsh -s /bin/zsh root

# Create a test user (optional, for testing user-specific configurations)
RUN useradd -m -s /bin/zsh testuser && \
    echo "testuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to zsh and set working directory
WORKDIR /root
CMD ["/bin/zsh"] 