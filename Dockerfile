FROM node:16-alpine as builder

WORKDIR /unleash

COPY index.js package.json package-lock.json ./

RUN npm install -g npm

RUN npm install

FROM node:16-alpine

ENV NODE_ENV production

WORKDIR /unleash

COPY --from=builder /unleash /unleash

EXPOSE 4242

USER node

CMD node index.js
