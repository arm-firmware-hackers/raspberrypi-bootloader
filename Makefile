# Variablen definieren
BUILD_SCRIPT = ./build_boot.sh

# Default Target
all: rpi3 rpi4 rpi5

# Ziel für Raspberry Pi 3
rpi3:
	$(BUILD_SCRIPT) 1

# Ziel für Raspberry Pi 4
rpi4:
	$(BUILD_SCRIPT) 2

# Ziel für Raspberry Pi 5
rpi5:
	$(BUILD_SCRIPT) 3
