FROM node as build
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app

RUN npm install
COPY . /app
RUN npm run build --prod

FROM nginx:1.17.1-alpine
COPY --from=build /app/dist/kube-web-app /usr/share/nginx/html