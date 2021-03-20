FROM node:alpine
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
# nur eine Info, wird aber für ElasticBeanstalk benötigt, da EB diese Angabe verwendet um Ports nach außen bereitzustellen
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html