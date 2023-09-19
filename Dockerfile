FROM node:16-alpine AS builder
WORKDIR '/test'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx
COPY --from=builder /test/build  /usr/share/nginx/html