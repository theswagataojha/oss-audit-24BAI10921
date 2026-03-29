#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Swagata Ojha | Reg No: 24BAI10921
# Course: Open Source Software | OSS Capstone Project
# Description: Displays a welcome screen with system info
#              and open-source license details.
# ============================================================

# --- Student & Software Info ---
STUDENT_NAME="Swagata Ojha"          
REG_NUMBER="24BAI10921"    
SOFTWARE_CHOICE="Python"             

# --- Collect system information using command substitution ---
KERNEL=$(uname -r)                   # Linux kernel version
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')  # Distro name
USER_NAME=$(whoami)                  # Current logged-in username
HOME_DIR=$HOME                       # Home directory of current user
UPTIME=$(uptime -p)                  # Human-readable system uptime
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M:%S')  # Formatted date and time
HOSTNAME=$(hostname)                 # Machine hostname

# --- License info for the OS (Linux is GPL v2) ---
OS_LICENSE="GNU General Public License v2 (GPL v2)"

# --- Display Header ---
echo "============================================================"
echo "        OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT"
echo "============================================================"
echo ""

# --- Student Details ---
echo "  Student   : $STUDENT_NAME"
echo "  Roll No   : $ROLL_NUMBER"
echo "  Software  : $SOFTWARE_CHOICE (PSF License)"
echo ""
echo "------------------------------------------------------------"

# --- System Information ---
echo "  HOST      : $HOSTNAME"
echo "  DISTRO    : $DISTRO"
echo "  KERNEL    : $KERNEL"
echo "  USER      : $USER_NAME"
echo "  HOME      : $HOME_DIR"
echo "  UPTIME    : $UPTIME"
echo "  DATE/TIME : $CURRENT_DATE"
echo ""
echo "------------------------------------------------------------"

# --- License message ---
echo "  This system runs on Linux, covered by:"
echo "  $OS_LICENSE"
echo ""
echo "  The GPL v2 ensures users have the freedom to:"
echo "   [1] Run the software for any purpose"
echo "   [2] Study and modify the source code"
echo "   [3] Redistribute copies"
echo "   [4] Distribute modified versions"
echo ""
echo "============================================================"
echo "  'Software is like sex: it's better when it's free.'"
echo "  — Linus Torvalds"
echo "============================================================"
