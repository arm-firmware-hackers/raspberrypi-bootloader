#!/bin/bash
set -e

# Falls Argument übergeben wurde (1, 2 oder 3), direkt ausführen:
if [[ "$1" =~ ^[123]$ ]]; then
    case $1 in
        1) build_partition "Raspberry Pi 3" "RPI3" ;;
        2) build_partition "Raspberry Pi 4" "RPI4" ;;
        3) build_partition "Raspberry Pi 5" "RPI5" ;;
    esac
    exit 0
fi


build_partition() {
    local model=$1
    local src_dir=$2
    local target_image="boot.vfat"

    BOOT_FOLDER="$src_dir"  # Hier liegt dein Bootloader-Inhalt
    OUTPUT_IMAGE="$target_image"
    SIZE_MB=256                         # Größe der Boot-Partition in MB (100MB ist Raspberry-Pi-kompatibel)
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

    echo "✅ boot.vfat erfolgreich für $modelerstellt!"
}



# Hauptmenü mit Dialog
menu=$(dialog --title "Raspberry Pi - Bootloader" \
              --menu "Wählen Sie eine Option aus:" \
              15 50 3 \
              1 "Build Raspberry Pi 3 Bootloader" \
              2 "Build Raspberry Pi 4 Bootloader" \
              3 "Build Raspberry Pi 5 Bootloader" \
              2>&1 >/dev/tty)

# Je nach Auswahl entsprechende Aktion durchführen
case $menu in
    1)
        build_partition "Raspberry Pi 3" "RPI3"
        ;;
    2)
        build_partition "Raspberry Pi 4" "RPI4"
        ;;
    3)
        build_partition "Raspberry Pi 5" "RPI5"
        ;;
    *)
        echo "Ungültige Auswahl."
        exit 1
        ;;
esac
