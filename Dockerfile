FROM node:18

RUN npm install -g pnpm
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

ARG DISCORD_CLIENT_ID_E
ARG DISCORD_CLIENT_SECRET_E
ARG DISCORD_SERVER_ID_E
ARG DISCORD_BOT_TOKEN_E
ARG DISCORD_WEBHOOK_URL_E

ENV DISCORD_CLIENT_ID_E=$DISCORD_CLIENT_ID_E \
DISCORD_CLIENT_SECRET_E=$DISCORD_CLIENT_SECRET_E \
DISCORD_SERVER_ID_E=$DISCORD_SERVER_ID_E \
DISCORD_BOT_TOKEN_E=$DISCORD_BOT_TOKEN_E \
DISCORD_WEBHOOK_URL_E=$DISCORD_WEBHOOK_URL_E

WORKDIR /app
COPY package.json ./

COPY . .

RUN pnpm install 
RUN pnpm build


EXPOSE 3000
EXPOSE 5553


CMD ["pnpm", "dev"]