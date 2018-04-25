#!/bin/bash
# Asks whether or not to install
dialog \
  --yesno "\nInstall Receiver?" 10 30
if [ $? == 0 ]
then
  addrList=()
  echo "#!/bin/bash" > updater.sh
  echo "while :" >> updater.sh
  echo "do" >> updater.sh
  while :
  do
    addr=$(dialog --inputbox "What ip or domain do you want to connect to?" 10 25 --output-fd 1)
    dialog \
      --yesno "\nIs this correct? \n$addr" 10 30
    if [ $? == 0 ]
    then
      echo "wget $addr:8082/info.js" >> updater.sh
      wget -N $addr:8082/config.sh
      mv config.sh config$addr.sh 
      echo "mv info.js /var/www/html/$addr.js" >> updater.sh
      addrList+=("$addr")
      dialog \
        --yesno "\nAdd another?" 10 30
      if [ $? == 1 ]
      then
        break
      fi
    fi
  done
  echo "sleep 2" >> updater.sh
  echo "done" >> updater.sh

  # Builds webInterface/index.html based on previous data

  echo "
  <!DOCTYPE HTML>
    <html>
      <head>" > webInterface/index.html
  for i in ${addrList[@]}
  do
    source config$i.sh
    echo "config$i.sh"
    echo "
    <script>
    window.onload = function() {
      var dps = [];
      var chart = new CanvasJS.Chart('"$i"', {
        exportEnabled: true,
        title :{
          text: '"$name"'
        },
        axisY: {
          includeZero: false,
          viewportMaximum: 105,
          viewportMinimum: 0
        },
        data: [{
          type: '"line"',
          markerSize: 0,
          dataPoints: dps
        }]
      });

      var xVal = 0;
      var yVal = 100;
      var updateInterval = 1000;
      var dataLength = 200;

      var updateChart = function (count) {
        count = count || 1;
        
        for (var j = 0; j < count; j++) {
          load_js();
          yVal = server$name.coreAvg || 0;
          dps.push({
            x: xVal,
            y: yVal
          });
          xVal++;
        }
        if(dps.length > dataLength){
          dps.shift();
        }
        chart.render();
      };

      updateChart(dataLength);
      setInterval(function(){ updateChart() }, updateInterval);
      function load_js(){
        var head = document.getElementsByTagName('head')[0];
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = '$i.js';
        head.appendChild(script);
      }
    }
</script>
<br>
" >> webInterface/index.html
done
echo "
</head>
<body>" >> webInterface/index.html
  
for i in ${addrList[@]}
do
  echo "" >> webInterface/index.html
  echo -n '<div id=' >> webInterface/index.html
  echo -n "$i " >> webInterface/index.html
  echo -n 'style="height: 400px; width:80%"></div>' >> webInterface/index.html
done

echo "<script src='"https://canvasjs.com/assets/script/canvasjs.min.js"'></script>" >> webInterface/index.html

for i in ${addrList[@]}
do
  echo "
<script type="text/javascript" src="$i.js"></script>
  " >> webInterface/index.html
done
echo "</body>
</html>" >> webInterface/index.html



  sudo docker build -t receiver .
else
  exit 1
fi

# Asks whether or not to run previously installed container
dialog \
  --yesno "\nRun Receiver?" 10 30
if [ $? == 0 ]
then 
  #port=$(dialog --inputbox "What port should 80 be set to?" 10 25 --output-fd 1)
  port="8083"

  sudo docker run --name=receiver --restart=always -d -p $port:80 receiver
  sudo docker exec receiver /receiver/tmux.sh

fi
