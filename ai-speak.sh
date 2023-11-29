#!/bin/bash
# MIT LICENSE (KERNEL CUDDLE BUTT)
# REQUIREMENTS https://pub.dev/packages/google_speech
# Adds TTS Text output speach examples from llama cpp
file=./models/13b/current-prompt.txt""
lastmtime=0
while read -r mtime < <(stat -c '%Z' "$file")
do
        if [[ $lastmtime != $mtime ]]
        then
                lastmtime=$mtime
		google_speech "$(tail -1 $file)" 
        fi
        sleep 1
done
