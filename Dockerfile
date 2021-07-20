FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN ["npm", 'run', 'build']

# Post the above run step a build forlder is created in working directory
# which we need to move to production environment

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
