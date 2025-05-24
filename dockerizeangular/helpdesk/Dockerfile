#first stage: build image of the application
FROM node:alpine3.14 as build
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . /app/
RUN npm run build  --prod
# Expose the port the app runs on#second stage: build image of the server
FROM nginx:alpine
COPY --from=build /app/dist/helpdesk /usr/share/nginx/html