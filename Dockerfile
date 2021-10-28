# Build phase
FROM node:alpine as BuildPhase

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

# Run phase

FROM nginx
COPY --from=BuildPhase /app/build /usr/share/nginx/html