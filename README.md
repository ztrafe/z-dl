# z-dl

Dead-simple YouTube audio downloader for macOS.

Installs two Terminal commands:
- `ytmp3` → download MP3
- `ytwav` → download WAV

No quotes required, even for URLs with `?` or `&`.

## Install
```sh
git clone https://github.com/ztrafe/z-dl.git && cd z-dl && ./install.sh && source ~/.zshrc
```

## Usage
```bash
ytmp3 https://youtu.be/VIDEO_ID
ytwav https://youtu.be/VIDEO_ID
```

Works with full URLs, short links, and even URLs with parameters—no quotes needed:
```bash
ytmp3 https://www.youtube.com/watch?v=VIDEO_ID&t=30s
```

## What gets installed

- **Homebrew** (only if you don't already have it)
- **yt-dlp** (YouTube downloader)
- **ffmpeg** (audio conversion)
- **Download folders:**
  - `~/Music/yt-dl` (MP3)
  - `~/Music/yt-dl-wav` (WAV)
- **Shell commands** added to `~/.zshrc`:
  - `ytmp3`
  - `ytwav`

## Output locations

- **MP3:** `~/Music/yt-dl`
- **WAV:** `~/Music/yt-dl-wav`

## Troubleshooting

### Command not found

Restart Terminal, or run:
```bash
source ~/.zshrc
```

### Permission denied when running install.sh
```bash
chmod +x install.sh
./install.sh
```

### WAV files are huge

This is expected—WAV is uncompressed audio. Use MP3 for general listening, WAV for production work in DAWs like Logic Pro or Ableton.

## Uninstall

1. Open `~/.zshrc` and delete the `ytmp3` and `ytwav` function definitions
2. (Optional) Uninstall dependencies:
```bash
   brew uninstall yt-dlp ffmpeg
```
3. (Optional) Remove downloaded files:
```bash
   rm -rf ~/Music/yt-dl ~/Music/yt-dl-wav
```

## Legal

Only download content you have the rights to use. Respect copyright and creator rights.

## Requirements

- macOS (tested on macOS 10.15+)
- Terminal with zsh (default on macOS Catalina and later)
