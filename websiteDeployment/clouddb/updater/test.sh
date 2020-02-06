test=$(uptime | awk '{print $3,$4,$1}' | sed 's/,//')

echo $test
