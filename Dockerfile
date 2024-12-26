# Step 1: Use a base image with Node.js
FROM node:18-alpine

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json into the container
COPY package*.json ./

# Step 4: Install dependencies, including the AWS SDK
# RUN npm install aws-sdk

# Step 5: Install other dependencies and build tools
RUN npm install

# Step 6: Copy the rest of the application code
COPY . .

# Step 7: Build the React app for production
RUN npm run build

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]