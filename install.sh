#!/usr/bin/env bash
# Bootstrap setup-ai on this machine: put the `setup-ai` CLI on your PATH.
# Run from inside the repo:  bash install.sh
# Or remote:  curl -fsSL https://raw.githubusercontent.com/<you>/setup-ai/main/install.sh | bash
set -euo pipefail

REPO="https://github.com/linder3hs/setup-ai.git"   # ← update if you move the repo
DEST="${SETUP_AI_HOME:-$HOME/dev/setup-ai}"
BIN_DIR="$HOME/.local/bin"

# If not already a checkout, clone it.
if [ -f "$(dirname "${BASH_SOURCE[0]}")/bin/setup-ai" ]; then
  DEST="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
elif [ ! -d "$DEST/.git" ]; then
  echo "Cloning setup-ai → $DEST"
  git clone "$REPO" "$DEST"
fi

mkdir -p "$BIN_DIR"
ln -sfn "$DEST/bin/setup-ai" "$BIN_DIR/setup-ai"
chmod +x "$DEST/bin/setup-ai"

echo "Linked $BIN_DIR/setup-ai → $DEST/bin/setup-ai"
case ":$PATH:" in
  *":$BIN_DIR:"*) ;;
  *) echo "Add to your shell rc:  export PATH=\"\$HOME/.local/bin:\$PATH\"" ;;
esac
echo "Done. Try:  setup-ai help"
