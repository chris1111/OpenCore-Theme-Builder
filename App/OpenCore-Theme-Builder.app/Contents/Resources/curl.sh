#!/bin/bash
# OpenCore Theme Builder
# Copyright (c) 2023, chris1111. All Right Reserved
# Credit: Acidanthera, blackosx, pngquant.
# Vars
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
apptitle="# OpenCore Theme Builder"
version="1.0"
TempDir="/Private/tmp/Icon"
CURL_DIR="/Private/tmp/Themes"
Master_DIR="/Private/tmp"

read -r -d '' applescriptCode <<'EOF'
   set dialogText to text returned of (display dialog "
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
⬇︎ IconSet List:
***************

Flavours-AppleDisk
Flavours-Blue  
Flavours-Border
Flavours-CleanDark
Flavours-Dark
Flavours-DarkSide
Flavours-Design
Flavours-Drive
Flavours-Frame
Flavours-Icons
Flavours-maOS
Flavours-Metallic
Flavours-Paper
Flavours-Tech
Flavours-X
NaturaliMac
NaturalMacBook
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Copy and paste in the dialog box the IconSet you want to have?
Or type the name, be sure to respect Uppercase and other punctuation!
The output theme name will be Flavours-Builder.
This will also download Acidanthera OcBinaryData.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -" default answer "" with icon 2)
   return dialogText
EOF

dialogText=$(osascript -e "$applescriptCode");


Sleep 1
# Download Themes from chris1111
echo "Download $dialogText resources Icons files"
Sleep 2
curl -L https://github.com/chris1111/OpenCore-Theme-Builder/raw/Master/ZIP/$dialogText.zip -o $CURL_DIR/Theme.zip


# Download Acidanthera OcBinaryData
echo "Download Acidanthera OcBinaryData without Drivers and .mp3 files"
curl -L https://github.com/acidanthera/OcBinaryData/archive/refs/heads/master.zip -o $Master_DIR/master.zip
Sleep 2

# Unzip Theme 
cd $CURL_DIR
unzip $CURL_DIR/Theme.zip
Sleep 1
# Unzip OcBinaryData
cd $Master_DIR
unzip $Master_DIR/master.zip
Sleep 1
rm -rf $Master_DIR/OcBinaryData-master/Drivers
rm -rf $Master_DIR/OcBinaryData-master/Resources/Image/Acidanthera/Chardonnay
rm -rf $Master_DIR/OcBinaryData-master/Resources/Image/Acidanthera/GoldenGate
rm -rf $Master_DIR/OcBinaryData-master/Resources/Image/Acidanthera/Syrah
rm -rf $Master_DIR/OcBinaryData-master/Resources/Audio/*.mp3

cd /Private/tmp/Themes
cp -Rp /$CURL_DIR/$dialogText/*.png $TempDir
