#!/bin/bash
set -e

echo "z-dl | macOS setup (ytmp3 + ytwav)"
echo

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed"
fi

echo
echo "Installing yt-dlp and ffmpeg..."
brew install yt-dlp ffmpeg

MP3_DIR="$HOME/Music/yt-dl"
WAV_DIR="$HOME/Music/yt-dl-wav"

mkdir -p "$MP3_DIR" "$WAV_DIR"

echo
echo "Folders created:"
echo "  MP3: $MP3_DIR"
echo "  WAV: $WAV_DIR"
echo

ZSHRC="$HOME/.zshrc"
touch "$ZSHRC"

# Remove old lines (if reinstalling)
grep -vE '^(alias ytmp3=|alias ytwav=)' "$ZSHRC" > "$ZSHRC.tmp" || true
mv "$ZSHRC.tmp" "$ZSHRC"

cat << 'EOF' >> "$ZSHRC"

# z-dl | YouTube audio download helpers (no quotes needed)
alias ytmp3='noglob yt-dlp -x --audio-format mp3 -o "$HOME/Music/yt-dl/%(title)s.%(ext)s"'
alias ytwav='noglob yt-dlp -x --audio-format wav -o "$HOME/Music/yt-dl-wav/%(title)s.%(ext)s"'
EOF

echo "Installed ytmp3 and ytwav into ~/.zshrc"
echo
echo "Next:"
echo "  source ~/.zshrc"
echo
echo "Use:"
echo "  ytmp3 https://youtu.be/VIDEO_ID"
echo "  ytwav https://youtu.be/VIDEO_ID"

