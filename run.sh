#!/bin/bash

# Function to check if Docker is installed
check_docker_installed() {
    if ! [ -x "$(command -v docker)" ]; then
        echo "Docker is not installed. Installing Docker..."
        install_docker
    else
        echo "Docker is already installed."
    fi
}

# Function to install Docker
install_docker() {
    # Update the apt package index
    sudo apt-get update

    # Install packages to allow apt to use a repository over HTTPS
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

    # Add Docker’s official GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Set up the stable repository for Docker
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update the package index again
    sudo apt-get update

    # Install the latest version of Docker Engine and containerd
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y

    echo "Docker installed successfully."
}

# Function to clone repository, build Docker image, and run container
setup_vpn() {
    # Clone the repository
    if [ ! -d "soft_vpn" ]; then
        git clone https://github.com/abhijeetyadav2121/soft_vpn.git
    fi

    cd soft_vpn

    # Build the Docker image
    docker build -t custom_vpn .

    # Run the Docker container
    docker run -d -p 1194:1194/udp -p 5555:5555 --restart unless-stopped custom_vpn

    echo "VPN setup completed and container is running."
}

# Check if Docker is installed and install if necessary
check_docker_installed

# Set up the VPN container
setup_vpn
