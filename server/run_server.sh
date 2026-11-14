#!/usr/bin/env bash
cd "$(dirname "$0")/.."
godot --headless --path . -- --server
