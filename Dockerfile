FROM node:alpine as build

WORKDIR /app

# configure deps first
COPY ./package.json ./
RUN npm install

# then copy source code
COPY . .

RUN npm run build


FROM nginx

COPY --from=build /app/build /usr/share/nginx/html
