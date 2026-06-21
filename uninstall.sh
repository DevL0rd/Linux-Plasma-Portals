#!/bin/bash
set -e
BIN_DIR="$HOME/.local/bin"
echo "Removing portal-games..."
rm -f "$BIN_DIR/portal-games"
echo "Removing widget(s)..."
for id in org.devl0rd.portal; do
    kpackagetool6 -t Plasma/Applet -r "$id" >/dev/null 2>&1 && echo "  removed $id" || true
done
echo "Done. (Custom art in ~/.local/share/Plasma-App-Portal was left in place.)"
