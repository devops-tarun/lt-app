#!/bin/bash

# Update system packages
apt-get update -y
apt-get upgrade -y
apt-get install -y curl git unzip

# Install Node.js LTS (v22.x)
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
apt-get install -y nodejs

# Verify Node.js and npm versions
node -v
npm -v

# Install MongoDB
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
apt-get update
apt-get install -y mongodb-org

# Start MongoDB service
systemctl start mongod
systemctl enable mongod

# Clone your MERN application (replace with your repo)
cd /home/ubuntu
git clone https://github.com/devops-tarun/lt-app.git

# switch to frontend, Install dependencies & Start it (adjust as needed)
cd lt-app/frontend
npm install
nohup npm start &

# switch to backend, Install dependencies & Start it (adjust as needed)
cd ../backend
npm install
nohup npm start &

echo "Node.js LTS and MongoDB setup complete. App is running."
