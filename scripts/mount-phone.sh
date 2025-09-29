#!/bin/bash

MOUNTPOINT="/mnt/Phone"
SSH_USER="u0_a1962"
SSH_PORT="8022"
SSH_PATH="/storage/emulated/0"

print_usage() {
    echo "Usage: $0 [mount|umount|status] [usb|ssh]"
    echo "  mount  - Mount phone (auto-detects method if not specified)"
    echo "  umount - Unmount phone"
    echo "  status - Check mount status"
    echo ""
    echo "Methods:"
    echo "  usb - Use MTP over USB"
    echo "  ssh - Use SSH/SSHFS over network"
    echo ""
    echo "If no method specified, script will auto-detect available options"
}

check_mount_status() {
    if mountpoint -q "$MOUNTPOINT" 2>/dev/null; then
        local mount_type=$(mount | grep "$MOUNTPOINT" | awk '{print $5}')
        case "$mount_type" in
            "fuse.simple-mtpfs")
                echo -e "Phone mounted via USB (MTP)"
                return 0
                ;;
            "fuse.sshfs")
                echo -e "Phone mounted via SSH"
                return 0
                ;;
            *)
                echo -e "Phone mounted (unknown method)"
                return 0
                ;;
        esac
    else
        echo -e "Phone not mounted"
        return 1
    fi
}

detect_phone_ip() {
    local phone_ip=""
    
    echo -e "Scanning for phone..."
    for ip in $(ip route | grep -E '192\.168\.[0-9]+\.[0-9]+' | awk '{print $9}' | head -3 | sed 's/\.[0-9]*$/.81/'); do
        if timeout 2 ssh -p "$SSH_PORT" -o ConnectTimeout=2 -o BatchMode=yes "$SSH_USER@$ip" exit 2>/dev/null; then
            phone_ip="$ip"
            break
        fi
    done
    
    if [ -z "$phone_ip" ]; then
        echo -e "Trying last known IP..."
        if timeout 2 ssh -p "$SSH_PORT" -o ConnectTimeout=2 -o BatchMode=yes "$SSH_USER@192.168.1.81" exit 2>/dev/null; then
            phone_ip="192.168.1.81"
        fi
    fi
    
    echo "$phone_ip"
}

mount_usb() {
    echo -e "Attempting USB mount..."
    mkdir -p "$MOUNTPOINT"
    
    DEVICE=$(simple-mtpfs -l 2>/dev/null | awk 'NR==1 {print $1}')
    if [ -z "$DEVICE" ]; then
        echo -e "No MTP device found."
        return 1
    fi
    
    if simple-mtpfs --device "$DEVICE" "$MOUNTPOINT" -o allow_other,uid=$(id -u),gid=$(id -g),rw 2>/dev/null; then
        echo -e "Phone mounted via USB at $MOUNTPOINT"
        return 0
    else
        echo -e "Failed to mount via USB"
        return 1
    fi
}

mount_ssh() {
    echo -e "Attempting SSH mount..."
    mkdir -p "$MOUNTPOINT"
    
    local phone_ip="${1:-$(detect_phone_ip)}"
    
    if [ -z "$phone_ip" ]; then
        echo -e "Could not find phone IP. Is SSH server running on phone?"
        echo -e "Make sure Termux SSH is running: pkg install openssh && sshd"
        return 1
    fi
    
    echo -e "Trying to connect to $phone_ip..."
    
    if sshfs -p "$SSH_PORT" "$SSH_USER@$phone_ip:$SSH_PATH" "$MOUNTPOINT" -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 2>/dev/null; then
        echo -e "Phone mounted via SSH at $MOUNTPOINT"
        return 0
    else
        echo -e "Failed to mount via SSH"
        echo -e "Check if SSH server is running on phone and credentials are correct"
        return 1
    fi
}

mount_phone() {
    local method="$1"
    
    if check_mount_status >/dev/null 2>&1; then
        echo -e "Phone already mounted"
        check_mount_status
        return 0
    fi
    
    case "$method" in
        "usb")
            mount_usb
            ;;
        "ssh")
            mount_ssh
            ;;
        *)
            echo -e "Auto-detecting connection method..."
            
            if simple-mtpfs -l 2>/dev/null | grep -q "^[0-9]"; then
                echo -e "USB device detected, trying USB mount..."
                if mount_usb; then
                    return 0
                fi
            fi
            
            echo -e "Trying SSH mount..."
            if mount_ssh; then
                return 0
            fi
            
            echo -e "Could not mount phone via any method"
            echo -e "Make sure phone is connected via USB or SSH server is running"
            return 1
            ;;
    esac
}

unmount_phone() {
    if ! check_mount_status >/dev/null 2>&1; then
        echo -e "Phone not mounted"
        return 0
    fi
    
    echo -e "Unmounting phone..."
    
    if lsof "$MOUNTPOINT" 2>/dev/null | grep -q .; then
        echo -e "Closing applications using phone storage..."
        lsof "$MOUNTPOINT" 2>/dev/null | awk 'NR>1 {print $2}' | sort -u | xargs -r kill -TERM 2>/dev/null
        sleep 2
    fi
    
    if fusermount -u "$MOUNTPOINT" 2>/dev/null; then
        echo -e "Phone unmounted successfully"
        return 0
    fi
    
    if umount "$MOUNTPOINT" 2>/dev/null; then
        echo -e "Phone unmounted successfully"
        return 0
    fi
    
    echo -e "Trying force unmount..."
    if umount -l "$MOUNTPOINT" 2>/dev/null; then
        echo -e "Phone force unmounted"
        return 0
    fi
    
    echo -e "Failed to unmount phone"
    echo -e "You may need to manually unmount: sudo umount -l $MOUNTPOINT"
    return 1
}

case "$1" in
    "mount")
        mount_phone "$2"
        ;;
    "umount"|"unmount")
        unmount_phone
        ;;
    "status")
        check_mount_status
        ;;
    "help"|"-h"|"--help")
        print_usage
        ;;
    *)
        if [ $# -eq 0 ]; then
            if check_mount_status; then
                exit 0
            else
                echo ""
                read -p "Mount phone? [Y/n]: " -n 1 -r
                echo
                if [[ $REPLY =~ ^[Yy]$|^$ ]]; then
                    mount_phone
                fi
            fi
        else
            echo -e "Unknown command: $1"
            print_usage
            exit 1
        fi
        ;;
esac
