#!/bin/bash

src="$(pwd)"
dest="$HOME"

echo "Copying files..."

shopt -s dotglob
cp -rT "$src"/* "$dst"/
shopt -u dotglob

echo "All copied."
