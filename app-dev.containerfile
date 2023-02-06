FROM node:18-slim  

ENV NODE_ENV development

WORKDIR /usr/src/app

COPY ./app/package.json ./app/package-lock.json ./

RUN yarn 

EXPOSE 5173
EXPOSE 24678

CMD ["yarn","dev","--host","0.0.0.0"]