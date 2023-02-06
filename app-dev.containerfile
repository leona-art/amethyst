FROM node:18-slim  

ENV NODE_ENV development

WORKDIR /usr/src/app

COPY ./app/package.json ./app/package-lock.json ./

RUN npm install

EXPOSE 5173
EXPOSE 24678

CMD ["npm","run","dev"]