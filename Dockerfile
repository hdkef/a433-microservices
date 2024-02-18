# image use node 14
FROM node:14

# set working directory to /app inside container
WORKDIR /app

# copy current directory to container
COPY . .

# set env
ENV NODE_ENV=production DB_HOST=item-db

# install dependency
RUN npm install --production --unsafe-perm && npm run build

# expose internal port container
EXPOSE 8080

CMD ["npm","start"]