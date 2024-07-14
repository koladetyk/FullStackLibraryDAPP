# Use an official Node.js runtime as the base image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and yarn.lock files
COPY package.json yarn.lock ./

# Install project dependencies
RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN yarn build

# Install serve globally
RUN yarn global add serve

# Expose port 3000 for the React app
EXPOSE 3000

# Serve the React app
CMD ["serve", "-s", "dist", "-l", "3000"]