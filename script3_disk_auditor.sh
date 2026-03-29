#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Swagata Ojha| Reg No: 24BAI10921
# Course: Open Source Software | Chosen Software: Python
# Description: Loops through key system directories and
#              reports disk usage, ownership, and permissions.
#              Also checks Python's config directories.
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib")

# --- Python-specific directories to check ---
PYTHON_DIRS=("/usr/lib/python3" "/usr/lib/python3.*" "/etc/python3" "/usr/local/lib/python3.*")

echo "========================================================"
echo "         DISK AND PERMISSION AUDITOR"
echo "========================================================"
echo ""
echo "  Format: [permissions] [owner] [group] | size"
echo ""
echo "--------------------------------------------------------"
echo "  SYSTEM DIRECTORIES"
echo "--------------------------------------------------------"

# --- for loop: iterate over each directory in the array ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists before inspecting
    if [ -d "$DIR" ]; then
        # awk extracts columns: $1=permissions, $3=owner, $4=group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # du -sh gives human-readable size; 2>/dev/null suppresses permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "  $DIR"
        echo "    Permissions/Owner: $PERMS"
        echo "    Disk Usage       : $SIZE"
        echo ""
    else
        # Directory does not exist on this system
        echo "  $DIR => [does not exist on this system]"
        echo ""
    fi
done

echo "--------------------------------------------------------"
echo "  PYTHON-SPECIFIC CONFIG & LIBRARY DIRECTORIES"
echo "--------------------------------------------------------"
echo ""

# --- Check Python's known installation paths using glob expansion ---
# Use find to locate Python directories dynamically
PYTHON_FOUND=false

# Check common Python paths; -maxdepth 1 avoids deep recursion
for PYDIR in /usr/lib/python3* /usr/local/lib/python3* /etc/python3*; do
    if [ -d "$PYDIR" ]; then
        PYTHON_FOUND=true
        # Get permissions: ls -ld shows directory line; awk parses it
        PERMS=$(ls -ld "$PYDIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$PYDIR" 2>/dev/null | cut -f1)

        echo "  $PYDIR"
        echo "    Permissions/Owner: $PERMS"
        echo "    Disk Usage       : $SIZE"
        echo ""
    fi
done

# --- Also check where Python binary lives ---
PYTHON_BIN=$(command -v python3 2>/dev/null)
if [ -n "$PYTHON_BIN" ]; then
    echo "  Python Binary     : $PYTHON_BIN"
    # ls -l shows permissions on the binary file itself
    BIN_PERMS=$(ls -l "$PYTHON_BIN" | awk '{print $1, $3, $4}')
    echo "  Binary Permissions: $BIN_PERMS"
    echo ""
fi

# --- If no Python directories were found, report it ---
if [ "$PYTHON_FOUND" = false ] && [ -z "$PYTHON_BIN" ]; then
    echo "  [WARNING] No Python installation directories found."
    echo "  Try: sudo apt install python3"
fi

echo "--------------------------------------------------------"
echo "  SECURITY NOTE"
echo "--------------------------------------------------------"
echo ""
echo "  Directories like /etc and /usr/bin are owned by root."
echo "  This limits who can modify system files — a core Linux"
echo "  security principle. Python runs as the invoking user,"
echo "  not root, which reduces privilege-escalation risk."
echo ""
echo "========================================================"
