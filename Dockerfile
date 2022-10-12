FROM node:slim

WORKDIR /usr/src/action
COPY . .
RUN yarn install --production
RUN ls -lrt
ENTRYPOINT ["node", "/usr/src/action/index.js"]