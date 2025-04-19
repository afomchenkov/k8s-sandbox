# 1. install dependencies stage
FROM node:22-alpine3.19 AS deps
WORKDIR /app
RUN apk add --no-cache gcompat bash curl
COPY ./package*.json ./
RUN npm ci

# 2. build the app stage
FROM deps AS builder
WORKDIR /app

COPY . ./
RUN npm run build

# 3. run prod build stage
FROM node:22-alpine3.19 AS runner
WORKDIR /app

COPY --from=builder /app/build ./build

USER node
ENV NODE_ENV="production"

CMD ["npm", "run", "dev"]