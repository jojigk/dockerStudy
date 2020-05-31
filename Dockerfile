FROM node:alpine as firststep
WORKDIR '/app/'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=firststep /app/build /usr/share/nginx/html
