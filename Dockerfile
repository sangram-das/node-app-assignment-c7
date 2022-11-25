FROM node:12
WORKDIR /app
COPY package.json ./
RUN npm i
COPY . .
EXPOSE 8081
CMD [ "node", "server.js" ]
