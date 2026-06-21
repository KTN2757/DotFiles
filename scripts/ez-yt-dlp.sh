#!/bin/bash
if [ $# -eq 3 ]; then
    yt-dlp "$1" -o "foo.webm" --use-extractors youtube --extractor-args "youtube:player_client=web" --cookies-from-browser firefox || { echo "Download failed"; exit 1; }
    ffmpeg -i foo.webm "$2.mp3"
    mv "./$2.mp3" "$HOME/Music/$3"
    rm "foo.webm"
fi
if [ $# -eq 4 ]; then
    yt-dlp "$1" -o "foo.webm" --use-extractors youtube --extractor-args "youtube:player_client=web" --cookies-from-browser firefox || { echo "Download failed"; exit 1; }
    ffmpeg -i foo.webm "$2.$3"
    mv "./$2.$3" "$HOME/Music/$4"
    rm "foo.webm"
fi
if [ $# -ne 3 ] && [ $# -ne 4 ]; then
    echo -e "ez-yt-dlp [URL] [Song Name] [Song Dir.]\nez-yt-dlp [URL] [Song Name] [Extension] [Song Dir.]"
fi

