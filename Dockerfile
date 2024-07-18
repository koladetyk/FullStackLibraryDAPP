FROM node:16

WORKDIR /app

# Copy application files
COPY . .

# Remove node_modules and package-lock.json if they exist
RUN rm -rf node_modules package-lock.json

# Install dependencies
RUN npm install

# Install Ganache CLI
RUN npm install -g ganache-cli

# Expose ports for the frontend and Ganache
EXPOSE 3000
EXPOSE 8545

# Start Ganache and Vite
CMD ganache-cli --chainId 1337 --account="0x1d3073850c2d71df5a268e82402a73bf163afe27a4640ba59025bf21a32136a1,100000000000000000000" --account="0x5a10b6a9a579a553037950b945025a6670a015310a8fc451022a705c1dbaccdd,100000000000000000000" -h 0.0.0.0 & npm run dev -- --host 0.0.0.0

