#!/bin/bash

# Set the download URL and destination directory
url="https://dl.filippo.io/age/latest?for=linux/amd64"
destination="$HOME/bin"

# Download the tarball to a temporary file
temp_tarball="./age.tgz"
curl -fsLS "$url" -o "$temp_tarball"

# Create the destination directory if it doesn't exist
mkdir -p "$destination"

# Extract the age and age-keygen files from the tarball to the destination directory
tar -xzf "$temp_tarball" --wildcards --no-anchored --strip-components=1 -C "$destination" 'age/age' 'age/age-keygen'

# Remove the temporary tarball file
rm "$temp_tarball"

echo "age and age-keygen have been installed to $destination"

# Add ~/bin to the PATH if it's not already present
export PATH="$PATH:$HOME/bin"
echo "Added $destination to PATH"
