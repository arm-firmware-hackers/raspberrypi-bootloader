# [+++ Raspberry Pi 3 - Bootfiles +++] #

```md
# ###################################################################################################################
# Datei/Ordner	      #      Funktion                                                                               #
# ###################################################################################################################
# bootcode.bin	      #      2. Stufe des Bootloaders – initialisiert RAM, lädt start.elf.                          #
# start.elf	          #      GPU-Firmware, lädt Kernel und konfiguriert das System.                                 #
# fixup.dat	          #      Zusatzdaten zur GPU-Firmware (passend zur start.elf).                                  #
# kernel8.img	      #      ARM64-Kernel (für 64-Bit-OS).                                                          #
# kernel7.img	      #      ARM32-Kernel (für RPi2/3 mit 32-Bit-OS).                                               #
# kernel.img	      #      Fallback-Kernel (für sehr alte RPi-Modelle).                                           #
# config.txt	      #      Konfigurationsdatei für Bootloader und GPU (z. B. Auflösung, UART etc).                #
# cmdline.txt	      #      Kernel-Bootparameter (z. B. Root-Dateisystem, Bootoptionen).                           #
# .dtb-Dateien	      #      Device Tree Blobs (Hardwarebeschreibung, z. B. bcm2710-rpi-3-b.dtb).                   #
# overlays/*.dtbo	  #      Device Tree Overlays zur Anpassung der Hardware-Konfiguration.                         #
# ###################################################################################################################


```



# Minimal Example List (for ARM64-Boot)


bootcode.bin
start.elf
fixup.dat
config.txt
cmdline.txt
kernel8.img
bcm2710-rpi-3-b.dtb
overlays/ (Folder with .dtbo-Dateien)
