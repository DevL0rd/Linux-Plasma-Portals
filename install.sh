#!/bin/bash
set -e

REPO_DIR=$(pwd)
if [ ! -f "$REPO_DIR/bin/portal-games" ]; then
    echo "Please run this script from the repository directory."
    exit 1
fi

BIN_DIR="$HOME/.local/bin"
PLASMOID_SRC="$REPO_DIR/plasmoids"

for bin in python3 kpackagetool6; do
    command -v "$bin" >/dev/null 2>&1 || echo "Warning: '$bin' is not installed or not in PATH."
done

# --- 1. games backend onto PATH (symlinked back to the repo) ---
mkdir -p "$BIN_DIR"
chmod +x "$REPO_DIR/bin/portal-games"
ln -sf "$REPO_DIR/bin/portal-games" "$BIN_DIR/portal-games"
echo "Linked portal-games into $BIN_DIR"

# --- 2. install the plasmoid(s) ---
echo "Installing widget(s)..."
for d in "$PLASMOID_SRC"/org.devl0rd.portal*; do
    if kpackagetool6 -t Plasma/Applet -u "$d" >/dev/null 2>&1; then
        echo "  upgraded $(basename "$d")"
    else
        kpackagetool6 -t Plasma/Applet -i "$d" >/dev/null 2>&1 && echo "  installed $(basename "$d")"
    fi
done

echo ""
echo "Done! Add it via right-click panel -> Add Widgets -> search \"App Portal\"."
echo "If it doesn't appear yet, run:  kquitapp6 plasmashell && kstart plasmashell"
