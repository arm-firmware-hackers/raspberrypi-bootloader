#!/bin/bash
set -e

# Funktion zum Erstellen der Partition
build_partition() {
    local model=$1
    local src_dir=$2
 

    BOOT_FOLDER="$src_dir" 
    OUTPUT_IMAGE="boot.vfat"
    SIZE_MB=256             
    MOUNTPOINT="/mnt/boot"
    LOOPDEV=""

    if [ ! -d "$BOOT_FOLDER" ]; then
        echo "❌ Ordner '$BOOT_FOLDER' existiert nicht!"
        exit 1
    fi

    rm -f "$OUTPUT_IMAGE"

    echo "📦 Erstelle $OUTPUT_IMAGE mit $SIZE_MB MB..."
    dd if=/dev/zero of="$OUTPUT_IMAGE" bs=1M count="$SIZE_MB"

    mkfs.vfat "$OUTPUT_IMAGE"

    mkdir -p "$MOUNTPOINT"

    LOOPDEV=$(sudo losetup --find --show "$OUTPUT_IMAGE")

    sudo mount "$LOOPDEV" "$MOUNTPOINT"

    echo "📁 Kopiere Bootdateien aus $BOOT_FOLDER nach $OUTPUT_IMAGE..."
    sudo cp -r "$BOOT_FOLDER"/* "$MOUNTPOINT"

    sync
    sudo umount "$MOUNTPOINT"
    sudo losetup -d "$LOOPDEV"

    echo "✅ boot.vfat erfolgreich für $model erstellt!"
}

if [[ "$1" =~ ^[123]$ ]]; then
    case $1 in
        1) build_partition "Raspberry Pi 3" "RPI3" ;;
        2) build_partition "Raspberry Pi 4" "RPI4" ;;
        3) build_partition "Raspberry Pi 5" "RPI5" ;;
    esac
else
    echo "❌ Ungültige Argumentnummer. Benutze 1 für RPI3, 2 für RPI4, oder 3 für RPI5."
    exit 1
fi
