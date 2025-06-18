#!/usr/bin/env bash

# Copies files from the repo to the paths defined in the file_map

while read -r src dest; do
	mkdir -p "$(eval echo "$dest")"
	cp -f "$src" "$(eval echo "$dest")"
done < file_map

