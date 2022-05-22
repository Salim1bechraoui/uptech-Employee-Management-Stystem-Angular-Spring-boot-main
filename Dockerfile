FROM node:latest as builder

RUN mkdir -p /app

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build --prod
EXPOSE 8080
ENTRYPOINT  ["npm", "start"]

FROM nginx:1.17.1-alpine
COPY src/nginx/default.conf /etc/nginx/conf/default.conf

COPY /dist/employee-management-system  /usr/share/nginx/html
