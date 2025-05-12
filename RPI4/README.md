# [+++ Raspberry Pi 4 / 4B - Bootloader Files +++] #



# [Needed Boot-Data for the Raspberry Pi 4/4B] #

```md
| File/Folder               | Usage                                                               |
| ------------------------- | ------------------------------------------------------------------- |
| **`start4.elf`**          | GPU-Firmware zur Initialisierung und Kernel-Start                   |
| **`fixup4.dat`**          | Zusatzdaten zur GPU-Firmware, muss zu `start4.elf` passen           |
| **`config.txt`**          | Konfiguration für Firmware (z. B. Auflösung, Kernelwahl, UART etc.) |
| **`cmdline.txt`**         | Kernel-Bootparameter (rootfs, Konsole, Bootverhalten)               |
| **`kernel8.img`**         | 64-Bit-Kernel (ARM64) – empfohlen für RPi 4                         |
| **`bcm2711-rpi-4-b.dtb`** | Device Tree Blob für das RPi 4 Modell B (SoC BCM2711)               |
| **`overlays/*.dtbo`**     | Device Tree Overlays (für zusätzliche Hardwarefunktionen)           |
| ------------------------- | ------------------------------------------------------------------- |

```


# Optional, often exist:

```md
| File/Folder                                       | Usage                                                                                                                |
| ------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| **`kernel.img` / `kernel7.img`**                  | Nur für 32-Bit-Kernel; `kernel8.img` hat Vorrang bei 64-Bit                                                          |
| **`start4cd.elf`, `start4db.elf`, `start4x.elf`** | Varianten von `start4.elf` mit reduziertem oder erweitertem Funktionsumfang (z. B. für „lite“ Builds oder Debugging) |
| **`fixup4cd.dat`, `fixup4x.dat`**                 | Passende Fixup-Dateien zu obigen `start4*.elf` Varianten                                                             |
| **`boot.scr`**                                    | U-Boot-Bootskript (wenn U-Boot verwendet wird, optional)                                                             |

```

# Example Minimalstruktur for a 64-Bit-Boot (without U-Boot):

```md
/boot
├── start4.elf
├── fixup4.dat
├── config.txt
├── cmdline.txt
├── kernel8.img
├── bcm2711-rpi-4-b.dtb
└── overlays/
    └── *.dtbo

```