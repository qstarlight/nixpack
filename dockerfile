# Use the official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first for efficient caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your project files into the container
COPY . .

# Run the build step (TypeScript compilation)
RUN npm run build

# Expose the port your app will run on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
