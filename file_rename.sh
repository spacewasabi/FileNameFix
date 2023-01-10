#!/bin/bash

# Set the base directory to the current directory
base_dir=$(pwd)

# Define a function to rename the files in a given directory
rename_files() {
  # Iterate through all the files in the directory
  for file in *
  do
    # Convert the file name to lowercase and replace spaces with underscores
    new_name=$(echo "$file" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')

    # Only rename the file if the new name is different from the old name
    if [ "$file" != "$new_name" ]
    then
      mv "$file" "$new_name"
    fi
  done
}

# Define a function to process a directory
process_dir() {
  # Change to the directory
  cd "$1"

  # Rename the files in the current directory
  rename_files

  # Iterate through all the subdirectories
  for dir in */
  do
    # Process the subdirectory
    process_dir "$dir"
  done

  # Change back to the base directory
  cd "$base_dir"
}

# Process the base directory
process_dir "$base_dir"
