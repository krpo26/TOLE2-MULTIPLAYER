#!/usr/bin/env bash
set -e
V=4.3-stable
cd /tmp
wget -q https://github.com/godotengine/godot/releases/download/$V/Godot_v${V}_linux.x86_64.zip
unzip -oq Godot_v${V}_linux.x86_64.zip
sudo mv Godot_v${V}_linux.x86_64 /usr/local/bin/godot
echo "Godot instalado"
