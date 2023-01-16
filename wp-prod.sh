#!/bin/bash

# Copy dir to output path
# Remove node-modules
# Zip folder

currentdate=`date +"%Y-%m-%d_%H-%M-%S"`
foldername="${currentdate}_export"

exportparent=~/Website_Projects/Testamentto/Exports
exportlocation=${exportparent}/${foldername}
sourcelocation=/var/www/contracts/wp-content/themes/contracts-theme

zipname="${foldername}.zip"

mkdir $exportlocation
echo "Made folder ${foldername}"
cp -r ${sourcelocation}/* ${exportlocation}/
echo "Copied folders over"
rm -r ${exportlocation}/node_modules
echo "Removed node modules"
cd $exportlocation
zip -rq ${exportparent}/${zipname} *
echo "Zipped the folder"
cd $exportparent
rm -r $exportlocation
echo "Removed the copied files leaving only the zip"
