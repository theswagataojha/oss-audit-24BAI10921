#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Swagata Ojha | Reg No: 24BAI10921
# Course: Open Source Software | OSS Capstone Project
# Description: Checks if a FOSS package is installed, shows
#              its version/license, and prints a philosophy
#              note about the package using a case statement.
# ============================================================

# --- Target package (Python is often called 'python3' on Linux) ---
PACKAGE="python3"

echo "============================================================"
echo "           FOSS PACKAGE INSPECTOR"
echo "============================================================"
echo ""

# --- Detect package manager and check installation ---
# Try rpm-based systems first (Fedora, CentOS, RHEL)
if command -v rpm &>/dev/null; then
    if rpm -q $PACKAGE &>/dev/null; then
        echo "  [FOUND] '$PACKAGE' is installed (rpm-based system)."
        echo ""
        echo "  --- Package Details ---"
        # Extract Version, License, and Summary from rpm metadata
        rpm -qi $PACKAGE | grep -E 'Version|License|Summary'
    else
        echo "  [NOT FOUND] '$PACKAGE' is NOT installed via rpm."
        echo "  To install: sudo dnf install $PACKAGE"
    fi

# Try dpkg-based systems (Ubuntu, Debian)
elif command -v dpkg &>/dev/null; then
    if dpkg -l $PACKAGE 2>/dev/null | grep -q "^ii"; then
        echo "  [FOUND] '$PACKAGE' is installed (dpkg-based system)."
        echo ""
        echo "  --- Package Details ---"
        # Use dpkg to show package info and filter relevant lines
        dpkg -l $PACKAGE | grep "^ii" | awk '{print "  Version : "$3"\n  Package : "$2}'
        # Also try to show description
        dpkg -s $PACKAGE 2>/dev/null | grep -E 'Version|License|Description'
    else
        echo "  [NOT FOUND] '$PACKAGE' is NOT installed via dpkg."
        echo "  To install: sudo apt install $PACKAGE"
    fi

else
    # Fallback: check if python3 binary exists directly
    if command -v python3 &>/dev/null; then
        echo "  [FOUND] 'python3' binary exists on this system."
        echo ""
        echo "  --- Python Version ---"
        python3 --version
    else
        echo "  [NOT FOUND] Python3 is not available on this system."
    fi
fi

echo ""
echo "------------------------------------------------------------"
echo "  --- Open Source Philosophy Notes ---"
echo ""

# --- Case statement: prints a philosophy note for each known package ---
# The case statement matches the package name and prints relevant info
case $PACKAGE in
    python3 | python)
        echo "  Python (PSF License):"
        echo "  Born from Guido van Rossum's desire for a readable,"
        echo "  open language — shaped entirely by community consensus."
        echo "  The PSF license lets anyone use, modify, and distribute"
        echo "  Python freely, even in commercial products."
        ;;
    httpd | apache2)
        echo "  Apache HTTP Server (Apache 2.0):"
        echo "  The web server that built the open internet — still"
        echo "  powering ~30% of all websites globally. Apache 2.0"
        echo "  allows commercial use without sharing modifications."
        ;;
    mysql | mysql-server)
        echo "  MySQL (GPL v2 / Commercial dual-license):"
        echo "  Open source at the heart of millions of apps."
        echo "  Its dual license model is a landmark case study in"
        echo "  how OSS and commercial interests can coexist."
        ;;
    vlc)
        echo "  VLC Media Player (LGPL/GPL):"
        echo "  Built by students in Paris who wanted to stream video"
        echo "  over their university network. Freedom through necessity."
        ;;
    firefox)
        echo "  Firefox (MPL 2.0):"
        echo "  A nonprofit's answer to browser monopolies."
        echo "  Mozilla proves that open source can fight for user"
        echo "  rights even against trillion-dollar corporations."
        ;;
    git)
        echo "  Git (GPL v2):"
        echo "  Linus Torvalds built Git in two weeks after a proprietary"
        echo "  VCS failed the Linux community. A tool of freedom,"
        echo "  born from frustration with proprietary constraints."
        ;;
    *)
        # Default case: if package is not in the known list
        echo "  '$PACKAGE': An open-source tool that contributes to the"
        echo "  global commons of freely shared knowledge and code."
        ;;
esac

echo ""
echo "============================================================"
