# 1. install dependencies stage
FROM node:22-alpine3.19 AS deps
WORKDIR /app
RUN apk add --no-cache gcompat bash curl
COPY package*.json ./
RUN npm ci

# 2. build the app stage
FROM node:22-alpine3.19 AS builder
WORKDIR /app

COPY . .
COPY --from=deps /app/node_modules ./node_modules
RUN npm run build

# 3. run prod build stage
FROM node:22-alpine3.19 AS runner
WORKDIR /usr/app

COPY --from=builder /app/build ./build
COPY package*.json ./

RUN npm ci

USER node
ENV NODE_ENV="production"

CMD ["npm", "start"]