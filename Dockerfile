# Section 1 - install dependencies and run npm run build command
FROM node:alpine
WORKDIR /app
COPY ${PWD}/package.json .
RUN yarn
COPY . .
RUN yarn build

# Section 2 - Install nginx and copy over output of build
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html