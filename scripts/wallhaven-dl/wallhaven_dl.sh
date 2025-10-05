#!/bin/bash
WALLPAPER_DIR="${HOME}/Pictures/Wallpapers"
EXTENSIONS=("jpg" "png" "webp")
MISSING_LOG="${WALLPAPER_DIR}/missing_wallpapers.txt"

if [ -z "${1:-}" ]; then
    echo "Usage: wallhaven_dl <urls-file>"
    exit 1
fi

file="$1"
if [ ! -f "$file" ]; then
    echo "Error: file '$file' not found!"
    exit 1
fi

total=0
downloaded=0
skipped=0
failed=0
> "$MISSING_LOG"

echo "Starting Wallhaven download..."
echo ""
while IFS= read -r url || [ -n "$url" ]; do
    if [[ -z "$url" || "$url" =~ ^[[:space:]]*# ]]; then
        continue
    fi
    
    if [[ $url == *"wallhaven.cc/w/"* ]]; then
        ((total++))
        
        id=$(echo "$url" | sed -n 's|.*/w/\([^/]*\).*|\1|p')
        
        if [ -z "$id" ]; then
            echo "Warning: Could not extract ID from: $url"
            continue
        fi
        
        first_two=${id:0:2}
        if ls "${WALLPAPER_DIR}/wallhaven-${id}".* 1> /dev/null 2>&1; then
            echo "Already exists: wallhaven-${id}"
            ((skipped++))
            continue
        fi
        
        download_success=false
        for ext in "${EXTENSIONS[@]}"; do
            download_url="https://w.wallhaven.cc/full/${first_two}/wallhaven-${id}.${ext}"
            http_status=$(curl -s -o /dev/null -w "%{http_code}" --head "$download_url")
            
            if [ "$http_status" = "200" ]; then
                echo "Downloading: wallhaven-${id}.${ext}"
                if curl -s -f -o "${WALLPAPER_DIR}/wallhaven-${id}.${ext}" "$download_url"; then
                    download_success=true
                    ((downloaded++))
                    echo "Success: wallhaven-${id}.${ext}"
                    break
                fi
            fi
        done
        
        if [ "$download_success" = false ]; then
            echo "Failed: $id"
            echo "$url" >> "$MISSING_LOG"
            ((failed++))
        fi
    else
        echo "Skipping invalid URL: $url"
    fi
done < "$file"

echo ""
echo "======================================="
echo "Download Summary"
echo "======================================="
echo "Total URLs processed: ${total}"
echo "Downloaded: ${downloaded}"
echo "Skipped (already exist): ${skipped}"
echo "Failed: ${failed}"

if [ $failed -gt 0 ]; then
    echo ""
    echo "Check ${MISSING_LOG} for failed downloads."
else
    rm -f "$MISSING_LOG"
fi

echo "Done!"
