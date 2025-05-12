### **`README.md` (English)**

```markdown
# Raspberry Pi Custom Firmware

This repository contains the necessary files and instructions to build a custom firmware for all Raspberry Pi versions (Pi 3, Pi 4, and Pi 5). The firmware includes the bootloader and kernel to run a minimal Linux setup on the Raspberry Pi. It can be used for developing your own Linux distribution, bootloader, or custom firmware setup.

## Supported Raspberry Pi Models

- **Raspberry Pi 3** (RPi 3)
- **Raspberry Pi 4** (RPi 4)
- **Raspberry Pi 5** (RPi 5)

## Boot Files for Raspberry Pi 3, 4, and 5

### Raspberry Pi 3

The following files are required to boot the Raspberry Pi 3:

- **start.elf**: GPU firmware that initializes the Raspberry Pi's hardware.
- **fixup.dat**: Supplementary data to the GPU firmware.
- **config.txt**: Configuration file for the bootloader and hardware settings.
- **cmdline.txt**: Kernel boot parameters.
- **kernel7.img**: 32-bit kernel image.
- **bcm2710-rpi-3-b.dtb**: Device tree blob for the Raspberry Pi 3.
- **overlays/**: Folder containing device tree overlays for additional hardware configuration.

### Raspberry Pi 4

The following files are required to boot the Raspberry Pi 4:

- **start4.elf**: GPU firmware for Pi 4.
- **fixup4.dat**: Supplementary data for the GPU firmware.
- **config.txt**: Configuration file.
- **cmdline.txt**: Kernel boot parameters.
- **kernel8.img**: 64-bit kernel image.
- **bcm2711-rpi-4-b.dtb**: Device tree blob for the Raspberry Pi 4.
- **overlays/**: Folder containing device tree overlays.

### Raspberry Pi 5

The following files are required to boot the Raspberry Pi 5:

- **start5.elf**: GPU firmware for Pi 5.
- **fixup5.dat**: Supplementary data for the GPU firmware.
- **config.txt**: Configuration file.
- **cmdline.txt**: Kernel boot parameters.
- **kernel8.img**: 64-bit kernel image.
- **bcm2712-rpi-5-b.dtb**: Device tree blob for the Raspberry Pi 5.
- **overlays/**: Folder containing device tree overlays.

## Directory Structure

Here is the directory structure you should have on the boot partition for all models:

/boot
├── start\*.elf       # Pi 3, Pi 4, or Pi 5 GPU firmware
├── fixup\*.dat       # Pi 3, Pi 4, or Pi 5 fixup data
├── config.txt       # Configuration file for boot
├── cmdline.txt      # Kernel boot parameters
├── kernel\*.img      # Pi 3 (kernel7.img) / Pi 4 & 5 (kernel8.img)
├── bcm2710\*.dtb     # Pi 3 (bcm2710-rpi-3-b.dtb)
├── bcm2711\*.dtb     # Pi 4 (bcm2711-rpi-4-b.dtb)
├── bcm2712\*.dtb     # Pi 5 (bcm2712-rpi-5-b.dtb)
└── overlays/         # Device tree overlays
└── \*.dtbo

```

## Build Instructions

1. **Clone this repository**:

```bash
   git clone https://github.com/yourusername/rpi-firmware.git
   cd rpi-firmware
```

2. **Download the necessary firmware files** (e.g., from the Raspberry Pi Firmware GitHub repository).

3. **Copy the files to the boot partition** of your Raspberry Pi's SD card:

```bash
   cp -r /path/to/boot/* /media/pi/boot/
```

4. **Insert the SD card** into your Raspberry Pi (Model 3, 4, or 5) and power it on. The device should boot into your custom firmware setup.

## Customization

You can customize the following:

* Modify `config.txt` for hardware-specific configurations.
* Change `cmdline.txt` for kernel parameters (e.g., setting the root filesystem location).
* Use a custom kernel by replacing `kernel8.img` (Pi 4 & 5) or `kernel7.img` (Pi 3) with your own compiled kernel image.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```