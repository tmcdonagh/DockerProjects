const Discord = require("discord.js");
const client = new Discord.Client();

var auth = require('./auth.json');

client.on("ready", () => {
  console.log("I am ready!");
});

client.on("message", (message) => {
  if (message.content.startsWith("ping")) {
    message.channel.send("pong!");
  }
  if(message.content.startsWith("lmao")){
    message.channel.send("lmao");
  }

});

client.login(auth.token);

