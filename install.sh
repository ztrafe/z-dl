#!/bin/bash

# z-dl installer
# Dead-simple YouTube downloader for macOS

echo "Installing z-dl..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed ✓"
fi

# Install yt-dlp
if ! command -v yt-dlp &> /dev/null; then
    echo "Installing yt-dlp..."
    brew install yt-dlp
else
    echo "yt-dlp already installed ✓"
fi

# Install ffmpeg
if ! command -v ffmpeg &> /dev/null; then
    echo "Installing ffmpeg..."
    brew install ffmpeg
else
    echo "ffmpeg already installed ✓"
fi

# Create download directories
mkdir -p ~/Music/z-dl/mp3
mkdir -p ~/Music/z-dl/wav
mkdir -p ~/Movies/z-dl/mp4

echo "Created download folders"

# Check if functions already exist in .zshrc
if grep -q "ytmp3()" ~/.zshrc 2>/dev/null; then
    echo "z-dl commands already in .zshrc, skipping..."
else
    echo "Adding z-dl commands to ~/.zshrc..."
    
    cat >> ~/.zshrc << 'EOF'

# z-dl | YouTube download helpers

# Download YouTube audio as MP3
ytmp3() {
  mkdir -p ~/Music/z-dl/mp3
  yt-dlp -x --audio-format mp3 \
    -o ~/Music/z-dl/mp3/'%(title)s.%(ext)s' \
    "$@"
}

# Download YouTube audio as WAV
ytwav() {
  mkdir -p ~/Music/z-dl/wav
  yt-dlp -x --audio-format wav \
    -o ~/Music/z-dl/wav/'%(title)s.%(ext)s' \
    "$@"
}

# Download YouTube video as MP4
ytmp4() {
  mkdir -p ~/Movies/z-dl/mp4
  yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
    --merge-output-format mp4 \
    -o ~/Movies/z-dl/mp4/'%(title)s.%(ext)s' \
    "$@"
}
EOF

    echo "Commands added to .zshrc ✓"
fi

echo ""
echo "✓ Installation complete!"
echo ""
echo "Run this command to activate:"
echo "  source ~/.zshrc"
echo ""
echo "Usage (use quotes around URLs with ? or &):"
echo "  ytmp3 'https://youtu.be/VIDEO_ID'"
echo "  ytwav 'https://youtu.be/VIDEO_ID'"
echo "  ytmp4 'https://youtu.be/VIDEO_ID'"
echo ""
echo "Downloads will be saved to:"
echo "  ~/Music/z-dl/mp3/"
echo "  ~/Music/z-dl/wav/"
echo "  ~/Movies/z-dl/mp4/"
