# Standardziel
.PHONY: all
all:
	@echo "Bitte ein Ziel angeben: rpi3, rpi4 oder rpi5"

# Bootloader-Build-Ziel für Raspberry Pi 3
.PHONY: rpi3
rpi3:
	@echo "🔧 Erstelle Boot-Image für Raspberry Pi 3..."
	./build_boot.sh 1

# Bootloader-Build-Ziel für Raspberry Pi 4
.PHONY: rpi4
rpi4:
	@echo "🔧 Erstelle Boot-Image für Raspberry Pi 4..."
	./build_boot.sh 2

# Bootloader-Build-Ziel für Raspberry Pi 5
.PHONY: rpi5
rpi5:
	@echo "🔧 Erstelle Boot-Image für Raspberry Pi 5..."
	./build_boot.sh 3
