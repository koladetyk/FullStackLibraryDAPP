FROM node:14

WORKDIR /app

# Copy application files
COPY . .

# Install dependencies
RUN npm install

# Set up Ganache with predefined accounts
RUN npm install -g ganache

# Expose Ganache port
EXPOSE 8545

# Start Ganache and your application
CMD ganache --chainId 1337 --account="0x1234...,100000000000000000000" --account="0x5678...,100000000000000000000" & npm start