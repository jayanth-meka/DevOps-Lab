# Stage 1: Build React App
FROM node:20-alpine AS builder

WORKDIR /app
COPY . .

ENV NODE_OPTIONS=--openssl-legacy-provider

RUN npm install
RUN npm run build

# Stage 2: Serve with NGINX
FROM nginx:alpine

# Remove default index page
RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
