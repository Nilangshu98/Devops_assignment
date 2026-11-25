#!/bin/bash
{

if [ -z "$1" ]; then
	echo "Usage: $0 <log_file>"
	exit 1
fi

if [ ! -f "$1" ]; then
	echo "Error: File not found: $1"
	exit 1
fi

echo "==== LOG REPORT ===="

echo ""
echo "Total Requests:"
awk 'END {print NR}' "$1"

echo ""
echo "404 Errors:"
awk '$9 == 404 {count++} END {print count+0}' "$1"

echo ""
echo "Top 3 IP Addresses:"
awk '{print $1}' "$1" | sort | uniq -c | sort -nr | head -n 3

echo ""
echo "==== END OF REPORT ===="
} | tee "log_report_$(whoami).txt"

