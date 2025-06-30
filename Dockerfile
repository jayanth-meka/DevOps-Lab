FROM node:14.16.0-alpine3.13
WORKDIR /react-app
COPY package*.json .
RUN npm install
COPY . .
ENV API_URL=http://api.myapp.com/
EXPOSE 3000
CMD ["npm", "start"]