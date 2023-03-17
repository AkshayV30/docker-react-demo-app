FROM node:18-alpine3.16  as builder

WORKDIR '/usr/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=builder /usr/app/build /usr/share/nginx/html