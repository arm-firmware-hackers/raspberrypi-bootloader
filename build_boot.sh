#!/bin/bash
set -e

# Funktion zum Erstellen der Partition
build_partition() {
    local model=$1
    local src_dir=$2
    local target_image="boot.vfat"

    BOOT_FOLDER="$src_dir"  # Hier liegt dein Bootloader-Inhalt
    OUTPUT_IMAGE="$target_image"
    SIZE_MB=256             # Größe der Boot-Partition in MB
    MOUNTPOINT="/mnt/boot"
    LOOPDEV=""

    # Prüfen ob Ordner existiert
    if [ ! -d "$BOOT_FOLDER" ]; then
        echo "❌ Ordner '$BOOT_FOLDER' existiert nicht!"
        exit 1
    fi

    # Existierende boot.vfat entfernen
    rm -f "$OUTPUT_IMAGE"

    # Image-Datei erstellen
    echo "📦 Erstelle $OUTPUT_IMAGE mit $SIZE_MB MB..."
    dd if=/dev/zero of="$OUTPUT_IMAGE" bs=1M count="$SIZE_MB"

    # FAT32-Dateisystem erstellen
    mkfs.vfat "$OUTPUT_IMAGE"

    # Temporäres Mount-Verzeichnis erstellen
    mkdir -p "$MOUNTPOINT"

    # Loopback-Device einrichten
    LOOPDEV=$(sudo losetup --find --show "$OUTPUT_IMAGE")

    # Mounten
    sudo mount "$LOOPDEV" "$MOUNTPOINT"

    # Dateien kopieren
    echo "📁 Kopiere Bootdateien aus $BOOT_FOLDER nach $OUTPUT_IMAGE..."
    sudo cp -r "$BOOT_FOLDER"/* "$MOUNTPOINT"

    # Synchronisieren und unmounten
    sync
    sudo umount "$MOUNTPOINT"
    sudo losetup -d "$LOOPDEV"

    echo "✅ boot.vfat erfolgreich für $model erstellt!"
}

# Skript erwartet Argument: Modellnummer (1 für rpi3, 2 für rpi4, 3 für rpi5)
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
