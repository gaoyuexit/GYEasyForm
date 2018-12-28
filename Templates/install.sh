#!/bin/bash

folderName="GYEasyForm"
# Determine the install directory.
installDirectory=~/Library/Developer/Xcode/Templates/"$folderName"

if [ ! -d "$installDirectory" ]
then
	mkdir -p "$installDirectory"
fi

# Copy all of the xctemplate folders recursive into the install directory.
\cp -fr *.xctemplate "$installDirectory"

echo "install success 🍺🍺🍺"
echo "Please turn off xcode and then reopen it."






