#!/bin/bash

for f in *.{mp3,flac,m4a}; do
    ffmpeg -i "${f}" "${f%.*}.wav"
done
