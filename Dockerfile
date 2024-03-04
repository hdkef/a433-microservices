# use node 14
FROM node:14

WORKDIR /app

# copy code
COPY . .

# Install app dependencies
RUN npm install

# Expose port
EXPOSE 3001

# Command to run the application
CMD ["node", "index.js"]