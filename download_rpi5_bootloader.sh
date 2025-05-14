func() {
local api_url="https://api.github.com/repos/arm-firmware-hackers/raspberrypi-bootloader/contents/RPI5"
    local dest_dir="RPI5"

    echo "[*] Lade Dateien aus $api_url herunter..."

    mkdir -p "$dest_dir"

    # Lade Dateiliste
    curl -s "$api_url" | jq -c '.[]' | while read -r item; do
        local type=$(echo "$item" | jq -r '.type')
        local name=$(echo "$item" | jq -r '.name')
        local download_url=$(echo "$item" | jq -r '.download_url')
        local path=$(echo "$item" | jq -r '.path')

        if [[ "$type" == "file" ]]; then
            echo "[>] Lade $path ..."
            curl -# -L "$download_url" -o "$dest_dir/$name"
        elif [[ "$type" == "dir" ]]; then
            echo "[~] Überspringe Unterordner: $path (rekursives Klonen nötig)"
        fi
    done

    echo "[✓] Download abgeschlossen."
}
func;
