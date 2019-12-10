#!/bin/bash
# Example time calculating script to be pasted into my other projects

START=$(date +%s) # Sets initial time for time calc
sleep 1


# Start time calc
END=$(date +%s)
totalSeconds=$(($END - $START))
if (( $totalSeconds > 60 ))
then
  totalMinutes=$(($totalSeconds/60))
  remainderSeconds=$(($totalSeconds - (60*$totalMinutes)))
  if [ $totalMinutes -eq 1 ]
  then
    echo "Script took $totalMinutes minute and $remainderSeconds seconds to complete"
  else
    echo "Script took $totalMinutes minutes and $remainderSeconds seconds to complete"
  fi
else
  echo "Script took $totalSeconds seconds to complete"
fi
# End time calc
