FROM node:18-alpine
# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /backend/
COPY package.json package-lock.json ./
RUN npm install -g npm@10.3.0
RUN npm install -g node-gyp
RUN npm config set fetch-retry-maxtimeout 600000 -g && npm install
ENV PATH /backend/node_modules/.bin:$PATH

WORKDIR /backend/app
COPY . .
RUN chown -R node:node /backend/app
USER node
EXPOSE 8085
CMD ["npm", "run", "develop"]