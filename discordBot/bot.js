const Discord = require("discord.js");
const client = new Discord.Client();

var auth = require('./auth.json');
var spam = false;

client.on("ready", () => {
  console.log("ready");
});

client.on("message", (message) => {
  if (message.content.startsWith("ping")) {
    message.channel.send("pong!");
  }
  if(
    message.content.startsWith("lmao") ||
    message.content.startsWith("Lmao")
  ){
    message.channel.send(":joy:");
  }
  if(
    message.content.startsWith("Lmfao") ||
    message.content.startsWith("lmfao") ||
    message.content.startsWith("LMFAO")
  ){
    message.channel.send(":joy: :joy: :joy:");
  }
  if(
    message.content.startsWith("Thx Lmao Bot") ||
    message.content.startsWith("Thanks asshole") ||
    message.content.startsWith("Thx bb") ||
    message.content.startsWith("thx bb")

  ){
    message.channel.send("np");
  }
  if(
    message.content.startsWith("niberius") ||
    message.content.startsWith("Niberius")

  ){
    message.channel.send("wasus");
  }
  if(
    message.content.startsWith("le mao") ||
    message.content.startsWith("Le mao")
  ){

    message.channel.send("https://imgur.com/a/pjRYfO0");

  }
  if(
    message.content.startsWith("icloud?") || 
    message.content.startsWith("iCloud?") ||
    message.content.startsWith("Icloud?") ||
    message.content.startsWith("ICloud?")
  ){
    message.channel.send("https://i.reddit.it/2qxyuf2zz9g11.jpg");
  }
  if(
    message.content.startsWith("UNRELIABLE") || 
    message.content.startsWith("UNRELIABLE?")
  ){
    message.channel.send("https://www.youtube.com/watch?v=mRRwbhN4-sU");
  }
  if(
    message.content.startsWith("WAM") ||
    message.content.startsWith("wam") ||
    message.content.startsWith("WAM?") ||
    message.content.startsWith("wam?") ||
    message.content.startsWith("Wam?") ||
    message.content.startsWith("Wam") ||
    message.content.startsWith("Dedodated wam") || 
    message.content.startsWith("dedodated wam")
  ){
    message.channel.send("https://www.youtube.com/watch?v=Xgop6Udl1_c");
  }
  if(
    message.content.startsWith("What's Boneless Pizza?") || 
    message.content.startsWith("whats boneless pizza?")
  ){
    message.channel.send("https://youtu.be/ud1JXqGWPvU");
  }

  if(
    message.content.startsWith("Is that spam I hear?")
  ){
    spam = true;
  }
  if(
    message.content.startsWith("Stop") || 
    message.content.startsWith("stop")
  ){
    spam = false;
  }
  if(spam == true){
    message.channel.send("Did someone say spam?");
  }


});

client.login(auth.token);

