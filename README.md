# oss-audit-24BAI10921

**Student Name:** SWAGATA OJHA 
**Roll Number:** 24BAI10921  
**Course:** Open Source Software — OSS Capstone Project  
**Chosen Software:** Python (PSF License)

---

## About This Project

This repository is the technical submission for *The Open Source Audit* — a capstone project for the OSS NGMC course. The project involves auditing Python as an open-source software project and demonstrating practical Linux shell scripting skills.

The repository contains five shell scripts that together cover system inspection, package management, disk auditing, log analysis, and open-source philosophy generation.

---

## Repository Structure

```
oss-audit-24BAI10921/
├── script1_system_identity.sh       # System welcome screen with OS/kernel/user info
├── script2_package_inspector.sh     # Checks if Python is installed + philosophy notes
├── script3_disk_permission_auditor.sh  # Audits key directories and Python paths
├── script4_log_analyzer.sh          # Scans log files for keywords
├── script5_manifesto_generator.sh   # Interactive OSS manifesto generator
└── README.md
```

---

## Scripts Overview

### Script 1 — System Identity Report
Displays a formatted welcome screen showing the Linux distribution, kernel version, logged-in user, home directory, system uptime, current date/time, and the open-source license that covers the OS (GPL v2).

**Shell concepts used:** Variables, `echo`, command substitution `$()`, string formatting.

---

### Script 2 — FOSS Package Inspector
Checks whether `python3` is installed on the system using `rpm` or `dpkg` depending on the Linux distribution. Displays version, license, and summary info. Uses a `case` statement to print philosophy notes about Python and other known OSS packages.

**Shell concepts used:** `if-then-else`, `case` statement, `rpm -qi` / `dpkg -l`, pipe with `grep`.

---

### Script 3 — Disk and Permission Auditor
Loops through a list of important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, `/usr/lib`) and reports permissions, owner, group, and disk size. Also checks Python-specific library directories and locates the `python3` binary.

**Shell concepts used:** `for` loop, arrays, `ls -ld`, `du -sh`, `awk`, `cut`, `command -v`.

---

### Script 4 — Log File Analyzer
Accepts a log file path and optional keyword as command-line arguments. Reads the file line by line, counts matching lines, calculates match percentage, and prints the last 5 matching lines. Includes a retry mechanism that searches for alternative log files if the provided path doesn't exist.

**Shell concepts used:** `while read` loop, `if-then`, counter variables, `$1`/`$2` arguments, `grep`, `tail`, `awk` for percentage.

---

### Script 5 — Open Source Manifesto Generator
Asks the user three interactive questions using `read -p`. Composes a personalised open-source philosophy statement using string concatenation, and saves it to `manifesto_<username>.txt`. Also demonstrates the concept of shell aliases via a comment.

**Shell concepts used:** `read` for user input, string concatenation, `>` and `>>` for file writing, `date`, `cat`, alias concept in comments.

---

## How to Run the Scripts on Linux

### Prerequisites
- A Linux system (Ubuntu, Debian, Fedora, CentOS, or any distribution)
- Bash shell (pre-installed on all Linux systems)
- `python3` installed for Script 2 to detect the package

### Step 1 — Clone the repository
```bash
git clone https://github.com/theswagataojha/oss-audit-24BAI10921.git
cd oss-audit-24BAI10921
```

### Step 2 — Make scripts executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_permission_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Step 3 — Run each script

**Script 1:**
```bash
./script1_system_identity.sh
```

**Script 2:**
```bash
./script2_package_inspector.sh
```

**Script 3:**
```bash
./script3_disk_permission_auditor.sh
```
> Note: Some directories like `/var/log` may require `sudo` for accurate size reporting.
```bash
sudo ./script3_disk_permission_auditor.sh
```

**Script 4:**
```bash
# Basic usage with default keyword 'error'
./script4_log_analyzer.sh /var/log/syslog

# With a custom keyword
./script4_log_analyzer.sh /var/log/syslog python

# On RPM-based systems (CentOS/Fedora)
./script4_log_analyzer.sh /var/log/messages error
```

**Script 5:**
```bash
./script5_manifesto_generator.sh
# Follow the interactive prompts
```

---

## Dependencies

| Script | Dependencies | Notes |
|--------|-------------|-------|
| Script 1 | `uname`, `whoami`, `uptime`, `date`, `hostname` | All pre-installed on Linux |
| Script 2 | `rpm` or `dpkg`, `python3` | Package manager depends on distro |
| Script 3 | `ls`, `du`, `awk`, `cut`, `which` | All pre-installed on Linux |
| Script 4 | `grep`, `tail`, `awk` | All pre-installed on Linux |
| Script 5 | `date`, `whoami`, `cat` | All pre-installed on Linux |

---

## Software Being Audited: Python

Python is an open-source, high-level programming language released under the **Python Software Foundation (PSF) License** — a permissive, BSD-compatible license that allows free use, modification, and distribution, even in commercial software.

- **First released:** 1991 by Guido van Rossum
- **License:** PSF License v2
- **Governed by:** Python Software Foundation (PSF)
- **Repository:** https://github.com/python/cpython

---

## Academic Integrity

All scripts in this repository are original work written for the OSS Capstone project. The report submitted separately on the VITyarthi portal is written in the student's own words.

---

*Submitted via VITyarthi portal as part of the OSS NGMC Capstone Project.*
