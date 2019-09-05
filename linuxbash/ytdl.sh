#!/bin/bash

while read url
do
  youtube-dl -f 251 $url
done

for file in *.webm
do
  ffmpeg -i "$file" "${file%.webm}.mp3"
done
