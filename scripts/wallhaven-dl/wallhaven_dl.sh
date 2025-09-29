#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: wallhaven_dl <urls-file>"
    exit 1
fi

file="$1"
if [ ! -f "$file" ]; then
    echo "Error: file '$file' not found!"
    exit 1
fi

cp "$file" ~/Pictures/Wallpapers/urls.txt
cd ~/Pictures/Wallpapers || exit

while IFS= read -r url; do
    if [[ $url == *"wallhaven.cc/w/"* ]]; then
        id=$(echo "$url" | grep -o '/w/[^/]*' | cut -d'/' -f3)
        first_two=${id:0:2}
        download_url="https://w.wallhaven.cc/full/${first_two}/wallhaven-${id}.jpg"
        echo "Downloading: $download_url"
        curl -s -O "$download_url"
    fi
done < urls.txt

echo "Cleaning Up!"
rm ~/Pictures/Wallpapers/urls.txt

