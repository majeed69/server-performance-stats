#!/bin/bash

echo "==============================="
echo " SERVER PERFORMANCE STATS"
echo "==============================="

echo ""
echo "1. CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'

echo ""
echo "2. Memory Usage:"
free -m | awk 'NR==2{
printf "Total: %sMB\nUsed: %sMB\nFree: %sMB\nUsage: %.2f%%\n",
$2,$3,$4,$3*100/$2 }'

echo ""
echo "3. Disk Usage:"
df -h / | awk 'NR==2{
printf "Total: %s\nUsed: %s\nFree: %s\nUsage: %s\n",
$2,$3,$4,$5 }'

echo ""
echo "4. Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6

echo ""
echo "5. Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -6

echo ""
echo "6. System Uptime:"
uptime -p

echo ""
echo "7. Load Average:"
uptime | awk -F'load average:' '{ print $2 }'

echo ""
echo "8. Logged In Users:"
who

echo ""
echo "==============================="
echo " END OF REPORT"
echo "==============================="
