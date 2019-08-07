FROM node:8.10-alpine
RUN mkdir /app \
    && chown node:node /app
WORKDIR /app
RUN npm install asar -g
USER node
COPY . .
ENTRYPOINT [ "asar" ]
