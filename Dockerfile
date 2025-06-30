FROM node:18-alpine
WORKDIR /react-app
COPY . .
RUN npm install
CMD ["npm", "start"]
ENV API_URL=http://api.myapp.com/
