#!/bin/bash

folderName="GYEasyForm"
# Determine the install directory.
installDirectory=~/Library/Developer/Xcode/Templates/"$folderName"

if [ -d "$installDirectory" ]
then
    rm -rf "$installDirectory"
fi

echo "uninstall success 😢😢😢"
echo "Please turn off xcode and then reopen it."






