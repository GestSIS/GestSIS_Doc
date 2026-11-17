FROM node:26

WORKDIR /app
RUN yarn global add retypeapp

CMD [ "sh" ]
