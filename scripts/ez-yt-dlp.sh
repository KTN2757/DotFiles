#!/bin/bash
if [ $# -eq 3 ]; then
    yt-dlp "$1" -o "foo.webm" --cookies-from-browser firefox
    ffmpeg -i foo.webm "$2.mp3"
    mv "./$2.mp3" "$HOME/Music/$3"
    cp "$HOME/Music/$3/$2.mp3" "/mnt/Windows/Users/Kritagya Dahal/Music/$3"
    rm "foo.webm"
fi
if [ $# -eq 4 ]; then
    yt-dlp "$1" -o "foo.webm" --cookies-from-browser firefox
    ffmpeg -i foo.webm "$2.$3"
    mv "./$2.$3" "$HOME/Music/$4"
    cp "$HOME/Music/$4/$2.$3" "/mnt/Windows/Users/Kritagya\ Dahal/Music/$4"
    rm "foo.webm"
fi
if [ $# -ne 3 ] && [ $# -ne 4 ]; then
    echo -e "ez-yt-dlp [URL] [Song Name] [Song Dir.]\nez-yt-dlp [URL] [Song Name] [Extension] [Song Dir.]"
fi

