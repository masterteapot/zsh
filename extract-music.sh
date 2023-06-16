#!/bin/bash

# This function unzips folders and copies them into the music folder

function jk_extract_music() {
    cd ~/Downloads/"Music Downloads"
    for f in *.zip; 
        do 
            echo "Imma unzipping:  $f"; 
            unzip $f -d "${f%.zip}"; 
            echo "copying "${f%.zip}" to music folder"; 
            cp -r "${f%.zip}" ~/Music/ ; 
        done
    rm *.zip;
#    scp -C -r * jaredskane:/mnt/jellies/Music/
}
