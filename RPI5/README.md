# Raspberry Pi 5 - Bootloader Files #




```md
# ✅ Erforderliche Boot-Dateien für den Raspberry Pi 5

| ------------------------- | ------------------------------------------------------------------- |
| File/Folder               | Usage                                                               |
| ------------------------- | ------------------------------------------------------------------- |
| **`start5.elf`**          | GPU-Firmware zur Initialisierung und Kernel-Start                   |
| **`fixup5.dat`**          | Zusatzdaten zur GPU-Firmware, muss zu `start5.elf` passen           |
| **`config.txt`**          | Konfiguration für Firmware (z. B. Auflösung, Kernelwahl, UART etc.) |
| **`cmdline.txt`**         | Kernel-Bootparameter (rootfs, Konsole, Bootverhalten)               |
| **`kernel8.img`**         | 64-Bit-Kernel (ARM64) – empfohlen für RPi 5                         |
| **`bcm2712-rpi-5-b.dtb`** | Device Tree Blob für das RPi 5 Modell B (SoC BCM2712)               |
| **`overlays/*.dtbo`**     | Device Tree Overlays (für zusätzliche Hardwarefunktionen)           |
| ------------------------- | ------------------------------------------------------------------- |


```


```md
# Optional, aber oft vorhanden:

| ------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| Datei/Ordner                                      | Zweck                                                                                                                |
| ------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| **`kernel.img` / `kernel7.img`**                  | Nur für 32-Bit-Kernel; `kernel8.img` hat Vorrang bei 64-Bit                                                          |
| **`start5cd.elf`, `start5db.elf`, `start5x.elf`** | Varianten von `start5.elf` mit reduziertem oder erweitertem Funktionsumfang (z. B. für „lite“ Builds oder Debugging) |
| **`fixup5cd.dat`, `fixup5x.dat`**                 | Passende Fixup-Dateien zu obigen `start5*.elf` Varianten                                                             |
| **`boot.scr`**                                    | U-Boot-Bootskript (wenn U-Boot verwendet wird, optional)                                                             |
| ------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |


```


```md
# Example Minimalstruct of a 64Bit Boot (Without U-Boot):

/boot
├── start5.elf
├── fixup5.dat
├── config.txt
├── cmdline.txt
├── kernel8.img
├── bcm2712-rpi-5-b.dtb
└── overlays/
    └── *.dtbo
```