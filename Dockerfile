FROM node:22.16-alpine3.22
RUN corepack enable && corepack prepare pnpm@9.15.1 --activate
WORKDIR /app
COPY .npmrc pnpm-workspace.yaml turbo.json ./
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY . .
# RUN pnpm build I am removing this cause for just development purposes I don't want to build the app
EXPOSE 3000 3001

