# Linux System Automation Tool (Shell Scripting Project)

A **menu-driven, modular Linux System Automation Tool** built using **Bash Shell Scripting**.  
This project helps users perform common **system administration, monitoring, file management, search, and backup tasks** from a single interactive terminal menu.

---

## 📌 Features

### 🔹 System Information
- Display hostname
- Kernel version
- System uptime
- OS details

### 🔹 Disk Usage
- Show disk usage using `df -h`

### 🔹 Memory & CPU Usage
- Display RAM usage
- CPU load information

### 🔹 File & Directory Operations
- Create file
- Delete file
- Create directory
- Remove directory

### 🔹 Search File
- Search for a file by name

### 🔹 Backup (Manual)
- Create backup of file or directory

### 🔹 Logged-in User Information
- Display current logged-in users

### 🔹 Compress / Uncompress & Auto Backup
- Compress file/directory (.tar.gz)
- Automatic backup folder creation
- Email notification with attachment (if configured)
- Activity logging

### 🔹 Exit
- Generate session report
- Send summary report via email

---

## 🛠️ Technologies Used

- Linux (Ubuntu)
- Bash Scripting
- Cron Jobs
- Mail Utility
- Tar & Gzip
- System Monitoring Commands (top, df, free, uptime, etc.)

---

## 📂 Project Structure

```
linux-system-automation-tool/
│
├── atomation_tool.sh
├── system_info.sh
├── disk_usage.sh
├── memory_cpu_usage.sh
├── file_dir.sh
├── search.sh
├── backup.sh
├── logged_info.sh
├── compress_backup.sh
└── README.md
```


## 📋 Menu Structure

Select Menu:-

1) Show System Information

2) Disk Usage

3) Memory & CPU Usage

4) File & Directory Operations

5) Search File

6) Backup File/Directory Operations (Manual)

7) Logged-in User Information

8) Compress/Uncompress File/Directory & Auto Backup

9) Exit


---

## 📧 Email Notification Feature

After task completion, the tool automatically sends a system report to the configured email address.

This tool can send:

- Backup file attachments
- Exit summary report
- Activity log updates

(Requires mail configuration)

---


## How to Run the Project
- git clone
- cd Linux-System-Atomation-tool-Shell-Scripting-Project-
- chmod +x *.sh
- ./atomation.sh


## 💻 Author

Shubham Patil
  
DevOps Enthusiast | Linux | Automation | CI/CD

---
