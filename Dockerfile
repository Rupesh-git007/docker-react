# To build production ready image and run
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#Related to nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html