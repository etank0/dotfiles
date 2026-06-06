#!/bin/sh

# Input file
input_file="dconf-full-backup.txt"

# Make a dir for regions
mkdir regions

# Split the file into regions
csplit -z -f "regions/region-" "$input_file" '/^\[/' '{*}'

# Test each region
for region_file in regions/region-*; do
    echo "Testing $region_file..."
    if dconf load / < "$region_file"; then
        echo "Success: $region_file"
    else
        echo "Failed: $region_file"
        # Optionally, log the failing region
        echo "Failing region:" >> dconf-failures.log
        cat "$region_file" >> dconf-failures.log
        echo "-------------------" >> dconf-failures.log
    fi
done
