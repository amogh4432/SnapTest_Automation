# 1. Use an official lightweight Node.js image
FROM node:20-slim

# 2. Install system dependencies for Chrome
# 'slim' images don't have libraries for graphics or web browsing.
# We install wget to download Chrome and gnupg to verify the download.
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    apt-transport-https \
    --no-install-recommends

# 3. Download and Install Google Chrome
# This adds the Google repository and installs the stable version of Chrome.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /usr/share/keyrings/googlechrome-linux-keyring.gpg \
    && sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/googlechrome-linux-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# 4. Set the working directory inside the container
WORKDIR /usr/src/app

# 5. Copy package files and install NPM dependencies
# We copy these first so that Docker caches the 'npm install' layer.
COPY package*.json ./
RUN npm install

# 6. Copy your entire framework code into the container
COPY . .

# 7. Define the command to run your tests
CMD ["npm", "run", "wdio"]