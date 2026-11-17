FROM node:26

WORKDIR /app
RUN npm install --global pnpm@12

CMD [ "sh" ]
