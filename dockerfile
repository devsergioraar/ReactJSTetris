FROM node:16-alpine as build

workdir /app
copy package.json ./
run npm install
copy . .
run npm run build

from nginx as prod-stage
copy --from=build /app/build /usr/share/nginx/html
expose 80 

CMD ["nginx", "-g", "daemon off;"]