#!/bin/bash

# This script helps diagnose and fix SSH connection issues

echo "=== SSH Connection Diagnostics ==="

# 1. Check if SSH key exists
echo -e "\n1. Checking SSH key..."
if [ -f /home/fveliz/.ssh/servarica ]; then
  echo "✓ SSH key exists"
  # Ensure correct permissions
  chmod 600 /home/fveliz/.ssh/servarica
  echo "✓ Set permissions to 600"
else
  echo "✗ SSH key not found at /home/fveliz/.ssh/servarica"
  exit 1
fi

# 2. Start SSH agent
echo -e "\n2. Starting SSH agent..."
eval $(ssh-agent -s)
echo "✓ SSH agent started"

# 3. Add key to SSH agent
echo -e "\n3. Adding key to SSH agent..."
echo "You will be prompted for your key passphrase:"
ssh-add /home/fveliz/.ssh/servarica
if [ $? -eq 0 ]; then
  echo "✓ Key added successfully"
else
  echo "✗ Failed to add key"
  exit 1
fi

# 4. Verify key is loaded
echo -e "\n4. Verifying key is loaded in agent..."
ssh-add -l
if [ $? -eq 0 ]; then
  echo "✓ Key is loaded in agent"
else
  echo "✗ No keys loaded in agent"
  exit 1
fi

# 5. Test SSH connection
echo -e "\n5. Testing SSH connection..."
echo "Attempting connection to root@38.102.84.90..."
ssh -v -i /home/fveliz/.ssh/servarica root@38.102.84.90 "echo 'Connection successful'"

# 6. Check if borg is installed on remote server
echo -e "\n6. Checking if borg is installed on remote server..."
ssh -i /home/fveliz/.ssh/servarica root@38.102.84.90 "which borg || echo 'Borg not found'"

# 7. Create backup directory on remote server
echo -e "\n7. Creating backup directory on remote server..."
ssh -i /home/fveliz/.ssh/servarica root@38.102.84.90 "mkdir -p /root/borg_backup && echo 'Directory created/verified'"

echo -e "\n=== Diagnostic Complete ==="
echo "If all checks passed, your SSH connection should be working correctly."
echo "You can now run your borg_backup script."
