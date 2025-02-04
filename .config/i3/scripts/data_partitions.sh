#!/bin/bash
#
# update_ignore_list.sh
#
# This script generates a new JSON-style IGNORE_LIST based on the output
# of fdisk -l (ignoring non-data partitions) and then replaces the IGNORE_LIST
# entry in your i3blocks configuration file (~/.config/i3/i3blocks.conf).
#
# Data partitions (allowed) are defined as partitions having the type:
#   - Linux filesystem
#   - Microsoft basic data
#
# All other partitions are added to the IGNORE_LIST.
#
# A backup of the original config file is created (i.e. i3blocks.conf.bak)
#
# Usage:
#   ./update_ignore_list.sh

# i3blocks configuration file (update the path if needed)
CONFIG_FILE="$HOME/.config/i3/i3blocks.conf"

# Check if config file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: $CONFIG_FILE not found."
    exit 1
fi

# Generate the ignore list by scanning fdisk output.
# Allowed partition types are:
#   • Linux filesystem
#   • Microsoft basic data
#
# All other partition types will be included.
ignore_list=$(sudo fdisk -l 2>/dev/null | awk '
BEGIN {
    allowed["Linux filesystem"] = 1;
    allowed["Microsoft basic data"] = 1;
}
# Process lines starting with "/dev"
(/^\/dev/) {
    dev = $1
    type = ""
    # Partition type may be in multiple columns (from field 6 onward)
    for(i=6; i<=NF; i++){
        type = type $i (i<NF ? " " : "")
    }
    # If this is not an allowed (i.e., data) partition, add it.
    if (!(type in allowed)) {
        sub("^/dev/", "", dev)
        print dev
    }
}')

# Build the JSON array from the ignore_list.
ignore_arr=()
while IFS= read -r line; do
    # Skip empty lines
    [ -z "$line" ] && continue
    ignore_arr+=("\"${line}\"")
done <<< "$ignore_list"

# Join the array elements with commas
json="["

for i in "${!ignore_arr[@]}"; do
    if [ "$i" -gt 0 ]; then
        json+=","
    fi
    json+="${ignore_arr[i]}"
done
json+="]"

echo "New IGNORE_LIST: $json"

# Make a backup copy of the configuration file
cp "$CONFIG_FILE" "$CONFIG_FILE.bak" || {
    echo "Error: Could not create backup file."
    exit 1
}

# Use sed to replace the line starting with IGNORE_LIST=
# The regex assumes that the IGNORE_LIST line is at the beginning of the line.
# Using '|' as the sed delimiter so we don't conflict with "/".
sed -i "s|^IGNORE_LIST=.*|IGNORE_LIST=$json|" "$CONFIG_FILE"

if [ $? -eq 0 ]; then
    echo "Successfully updated IGNORE_LIST in $CONFIG_FILE"
    echo "A backup of the original file is saved as $CONFIG_FILE.bak"
else
    echo "Error: Failed to update $CONFIG_FILE"
fi
