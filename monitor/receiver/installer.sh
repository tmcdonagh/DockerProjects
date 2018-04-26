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
      <head>
        <script>
  window.onload = function () {
  " > webInterface/index.html
  for i in ${addrList[@]}
  do
    source config$i.sh
    echo "var data$name = [];"
  done
  echo " 
  var chart = new CanvasJS.Chart('chartContainer', {
    zoomEnabled: true,
    title: {
      text: '"CPU Percentage"'
    },
    axisX: {
    },
    axisY: {
      //suffix: "%",
      includeZero: true
    },
    legend: {
    cursor:'"pointer"',
    verticalAlign: '"top"',
    fontSize: 22,
    fontColor: '"dimGrey"',
    itemclick : toggleDataSeries
  },
  data: [{
  " >> webInterface/index.html
  total=0
  index=1
  for i in ${addrList[@]}
  do
    total=$(($total+1))
  done
 
  for i in ${addrList[@]}
  do
    source config$i.sh
    echo "
    type: '"line"',
    showInLegend: true,
    name: '"$name"',
    dataPoints: 'data$name'
    " >> webInterface/index.html
    if [ $index == $total ]
    then
      echo "
      }]
    });  
    " >> webInterface/index.html
    else
      index=$(($index+1))
      echo "
    },
    {
    " >> webInterface/index.html
    fi
   

  done
  echo "
  function toggleDataSeries(e) {
    if(typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible){
      e.dataSeries.visible = false;
    }
    else {
      e.dataSeries.visible = true;
    }
    chart.render();
  }
  var xVal = 0;
  var yVal = 100;
  var updateInterval = 2000;
  var dataLength = 200;
  " >> webInterface/index.html
  for i in ${addrList[@]}
  do
    source config$i.sh
    echo "
    var yValue$name = 0;
    " >> webInterface/index.html
  done
  echo "
  function updateChart(count){
    count = count || 1;
    load_js();
  " >> webInterface/index.html
  for i in ${addrList[@]}
  do
    source config$i.sh
    echo "yValue$name = server$name.coreAvg || 0;" >> webInterface/index.html
  done
  for i in ${addrList[@]}
  do
    source config$i.sh
    echo "
    data$name.push({
      x: xVal,
      y: yValue$name
    });
    " >> webInterface/index.html
  done
  numberData=0
  for i in ${addrList[@]}
  do
    source config$i.sh
    echo "
    chart.options.data[$numberData].legendText = " $name " + yValue$name;
    " >> webInterface/index.html
  done
  echo "
  chart.render();
  }

  updateChart(100);
  setInterval(function(){updateChart()}, updateInterval);
  function load_js(){
  " >> webInterface/index.html  
  for i in ${addrList[@]}
  do
    source config$i.sh
    echo "
    var head = document.getElementsByTagName('head')[0];
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = '"$addr.js"';
    head.appendChild(script);
    " >> webInterface/index.html
  done


  echo "
}
}
</script>
</head>
<body>
  " >> webInterface/index.html

echo '<div id='chartContainer' style="height: 370px; width:100%"></div>' >> webInterface/index.html

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
