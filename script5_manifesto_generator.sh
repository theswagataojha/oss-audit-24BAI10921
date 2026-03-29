#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Swagata Ojha| Reg No: 24BAI10921
# Course: Open Source Software | OSS Capstone Project
# Description: Asks the user three interactive questions and
#              generates a personalised open-source philosophy
#              statement, saving it to a .txt file.
# ============================================================

# --- Alias concept demonstrated via comment ---
# In a real shell session, you might define:
#   alias manifesto='./script5_manifesto_generator.sh'
# This lets you run the script simply by typing: manifesto
# Aliases are shortcuts — open source is also about making
# powerful tools accessible and easy to use.

# --- Helper function to print a divider line ---
print_divider() {
    echo "------------------------------------------------------------"
}

# --- Welcome banner ---
echo "============================================================"
echo "        OPEN SOURCE MANIFESTO GENERATOR"
echo "        OSS Capstone | Python Audit Edition"
echo "============================================================"
echo ""
echo "  Answer three questions to generate your personal"
echo "  open source philosophy statement."
echo ""
print_divider

# --- Question 1: Ask for a daily open-source tool ---
# 'read -p' displays a prompt and waits for user input
echo ""
read -p "  1. Name one open-source tool you use every day: " TOOL

# --- Question 2: Ask what freedom means to them ---
echo ""
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM

# --- Question 3: Ask what they would build and share ---
echo ""
read -p "  3. Name one thing you would build and share freely: " BUILD

# --- Validate that all three answers were provided ---
echo ""
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "  [ERROR] All three questions must be answered."
    echo "  Please re-run the script and provide all inputs."
    exit 1
fi

# --- Get current date and logged-in username ---
DATE=$(date '+%d %B %Y')          # Formatted as: 29 March 2026
AUTHOR=$(whoami)                  # Username of the person running the script

# --- Define output filename using the current username ---
OUTPUT="manifesto_${AUTHOR}.txt"

echo ""
print_divider
echo "  Generating your manifesto..."
print_divider
echo ""

# --- Compose the manifesto by concatenating strings and writing to file ---
# Using > first to create/overwrite the file, then >> to append each line

# Write the title using > (creates the file or overwrites if it exists)
echo "============================================================" > "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  By: $AUTHOR | Date: $DATE" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Write the main paragraph using string concatenation across multiple lines
# Each echo >> appends a new line to the file
echo "  Every day, I rely on $TOOL — a tool built not for profit," >> "$OUTPUT"
echo "  but for the common good. To me, 'freedom' means $FREEDOM." >> "$OUTPUT"
echo "  That is the same freedom that open-source software defends:" >> "$OUTPUT"
echo "  the freedom to use, study, share, and improve." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  I believe that knowledge grows when it is shared. I have" >> "$OUTPUT"
echo "  learned from the work of others who gave freely, and I" >> "$OUTPUT"
echo "  choose to do the same. One day, I will build $BUILD" >> "$OUTPUT"
echo "  and release it openly — so that someone else can stand" >> "$OUTPUT"
echo "  on my shoulders the same way I have stood on others'." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Python showed me this is possible. Guido van Rossum did" >> "$OUTPUT"
echo "  not lock away his language — he shared it. Today, Python" >> "$OUTPUT"
echo "  powers science, education, industry, and art worldwide." >> "$OUTPUT"
echo "  That is what openness achieves." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  This is my commitment to the open-source way." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  — $AUTHOR | $DATE" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm the file was saved ---
echo "  [SAVED] Your manifesto has been written to: $OUTPUT"
echo ""
print_divider
echo ""

# --- Display the generated manifesto using cat ---
cat "$OUTPUT"

echo ""
echo "============================================================"
echo "  Run 'cat $OUTPUT' anytime to read your manifesto again."
echo "============================================================"
