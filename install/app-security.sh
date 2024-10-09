#!/bin/bash

# app-security.sh: Script to install and schedule security tools

# Update system
sudo apt update && sudo apt upgrade -y

# Install ClamAV (Antivirus), chkrootkit (Rootkit detection) and UFW (Firewall)
sudo apt install clamav clamav-daemon chkrootkit ufw -y

# Update ClamAV database
sudo freshclam

# Enable UFW firewall with default settings
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Schedule a daily security check (using crontab)
(crontab -l ; echo "0 2 * * * /usr/local/bin/daily-security-check.sh") | crontab -

# Create the daily-security-check.sh script
cat << 'EOF' > /usr/local/bin/daily-security-check.sh
#!/bin/bash

# Scan the system with ClamAV
sudo clamscan -r / --quiet --infected --log=/var/log/clamav/daily_scan.log

# Run chkrootkit to check for rootkits
sudo chkrootkit > /var/log/chkrootkit.log

# Check if there are any infections or rootkits detected
clam_infections=$(grep "Infected files: 0" /var/log/clamav/daily_scan.log | wc -l)
rootkits_detected=$(grep "INFECTED" /var/log/chkrootkit.log | wc -l)

# If any infections or rootkits are found, send a desktop notification
if [[ $clam_infections -eq 0 || $rootkits_detected -ne 0 ]]; then
    notify-send "Security Alert" "Security scan found issues. Check logs for details."
fi
EOF

# Make the daily-security-check.sh script executable
sudo chmod +x /usr/local/bin/daily-security-check.sh

# Reload crontab to ensure the scheduled task is active
sudo systemctl restart cron

# Final message
echo "Security tools installed and scheduled. You will be notified if any issues are found."
