git clone https://github.com/abhijeetyadav2121/soft_vpn.git
cd soft_vpn
docker build -t custom_vpn .
 docker run -d  -p 1194:1194 -p 5555:5555 --restart unless-stopped custom_vpn
