#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author:Swagata Ojha| Reg No: 24BAI10921
# Course: Open Source Software | OSS Capstone Project
# Description: Reads a log file line by line, counts lines
#              containing a keyword, and prints a summary
#              with the last 5 matching lines.
# Usage: ./script4_log_analyzer.sh /var/log/syslog [keyword]
#        ./script4_log_analyzer.sh /var/log/messages error
# ============================================================

# --- Command-line arguments ---
# $1 = log file path (required)
# $2 = keyword to search (optional, defaults to 'error')
LOGFILE=$1
KEYWORD=${2:-"error"}    # If no keyword provided, default to 'error'

# --- Counter variables ---
COUNT=0          # Counts lines matching the keyword
TOTAL=0          # Counts total lines in the file

echo "============================================================"
echo "              LOG FILE ANALYZER"
echo "============================================================"
echo ""

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  [ERROR] No log file specified."
    echo "  Usage: $0 /path/to/logfile [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Check if the file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  [ERROR] File not found: $LOGFILE"

    # --- Do-while style retry: suggest alternative log files ---
    echo ""
    echo "  Trying common alternative log locations..."
    RETRY=0
    # Loop through common log files to find one that exists
    for ALTLOG in "/var/log/syslog" "/var/log/messages" "/var/log/kern.log" "/var/log/dmesg"; do
        if [ -f "$ALTLOG" ]; then
            echo "  [FOUND] Alternative log: $ALTLOG"
            echo "  Re-running analysis on: $ALTLOG"
            LOGFILE=$ALTLOG    # Replace the missing file with the found alternative
            RETRY=1
            break              # Exit loop once a valid file is found
        fi
    done

    # If no alternative was found either, exit
    if [ $RETRY -eq 0 ]; then
        echo "  [FAILED] No readable log files found. Exiting."
        exit 1
    fi
fi

# --- Check if the file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "  [WARNING] The file '$LOGFILE' is empty. No data to analyze."
    exit 0
fi

echo "  Log File  : $LOGFILE"
echo "  Keyword   : '$KEYWORD' (case-insensitive)"
echo ""
echo "  Scanning file..."
echo "------------------------------------------------------------"

# --- Read file line by line using a while-read loop ---
# IFS= preserves leading/trailing whitespace in each line
# -r prevents backslash interpretation
while IFS= read -r LINE; do
    TOTAL=$((TOTAL + 1))   # Increment total line counter for every line

    # --- Check if the current line contains the keyword (case-insensitive with -i) ---
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment match counter
    fi

done < "$LOGFILE"   # Redirect file into the while loop

echo ""

# --- Print summary results ---
echo "  RESULTS:"
echo "  Total lines scanned  : $TOTAL"
echo "  Lines with '$KEYWORD': $COUNT"

# --- Calculate percentage if total > 0 ---
if [ $TOTAL -gt 0 ]; then
    # Use awk for floating-point percentage calculation
    PERCENT=$(awk "BEGIN {printf \"%.2f\", ($COUNT/$TOTAL)*100}")
    echo "  Match percentage     : $PERCENT%"
fi

echo ""
echo "------------------------------------------------------------"

# --- Print last 5 lines that match the keyword ---
# Combines grep (filtering) with tail (last 5 results)
echo "  Last 5 matching lines:"
echo ""

MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -z "$MATCHES" ]; then
    echo "  (No matches found for '$KEYWORD')"
else
    # Print each matching line with a leading indicator
    echo "$MATCHES" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
fi

echo ""
echo "============================================================"
echo "  Analysis complete."
echo "============================================================"
