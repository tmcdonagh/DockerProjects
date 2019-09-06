const Discord = require("discord.js");
const client = new Discord.Client();

var auth = require('./auth.json');
var spam = false;

client.on("ready", () => {
  console.log("ready");
});

client.on("message", (message) => {
  var temp = message.toString();
  temp = temp.toUpperCase();
  if (message.author == client.user) {
    return
  }
  if(temp.indexOf("INDEXTEST") != -1){
    message.channel.send("worked");
  }
  if (message.content === '/join') {
    // Only try to join the sender's voice channel if they are in one themselves
    if (message.member.voiceChannel) {
      message.member.voiceChannel.join()
        .then(connection => { // Connection is an instance of VoiceConnection
          message.reply('I have successfully connected to the channel!');
        })
        .catch(console.log);
    } else {
      message.reply('You need to join a voice channel first!');
    }
  }
  if(
    //temp.indexOf("RAM") != -1 ||
    temp.indexOf("WAM") != -1){

    message.channel.send("https://www.youtube.com/watch?v=_pVNvSuA2mM");
  }
  if(temp.indexOf("ON GET") != -1){
    message.channel.send("<@&550373714471157820>");

  }
  if(temp.indexOf("NAZI") != -1){
    message.channel.send("https://www.youtube.com/watch?v=ZWd4eAF0F5g");
  }

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
    message.content.startsWith("UNRELIABLE") || 
    message.content.startsWith("UNRELIABLE?")
  ){
    message.channel.send("https://www.youtube.com/watch?v=mRRwbhN4-sU");
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

