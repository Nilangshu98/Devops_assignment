
#!/bin/bash
{

echo "==== SYSTEM INFORMATION ===="

echo ""
echo "HostName :"
hostname

echo ""
echo "Current Date and Time :"
date

echo ""
echo "Logged-in User:"
whoami

echo ""
echo "Disk Usage of Root (/):"
df -h /

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "Top 5 Processes by Memory:"
ps aux --sort=-%mem | head -n 6

echo ""
echo "==== END OF REPORT ===="
} | tee "sysinfo_$(whoami)_$(date +%F).txt"
