FROM node:latest

WORKDIR /usr/src/discordBot
COPY package*.json ./

COPY . .
RUN npm install discord.io winston --save
RUN npm install https://github.com/woor/discord.io/tarball/gateway_v6
#RUN apt update -qqy
#RUN apt install -qqy vim

EXPOSE  8080
#CMD [ "npm", "start" ]
#CMD [ "node", "bot.js" ]
CMD node bot.js
