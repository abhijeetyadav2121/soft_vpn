# Soft VPN

Soft VPN is a lightweight, customizable VPN solution that uses Docker for easy deployment. It provides a secure VPN tunnel using OpenVPN and other customizable features to meet various use cases.

## Features

- Lightweight and easy-to-deploy VPN solution.
- Uses Docker for containerization, ensuring easy setup and management.
- Automatically restarts unless manually stopped.
- Exposes VPN services on ports `1194` (UDP) and `5555`.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Git: [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Installation

To set up and run Soft VPN on your machine, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/abhijeetyadav2121/soft_vpn.git
   cd soft_vpn
   ```

2. **Build the Docker image**:
   ```bash
   docker build -t custom_vpn .

   ```

3. **Run the Docker container**:
   ```bash
   docker run -d -p 1194:1194 -p 5555:5555 --restart unless-stopped custom_vpn

   ```
