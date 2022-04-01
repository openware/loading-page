FROM node:alpine AS builder

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

COPY rollup.config.js ./
COPY src ./src
RUN npm run build

FROM nginx:alpine AS server

WORKDIR /usr/share/nginx/html
RUN apk add --no-cache gettext
COPY nginx-entrypoint.sh /
COPY --from=builder /app/dist ./

ENTRYPOINT [ "sh", "/nginx-entrypoint.sh" ]
