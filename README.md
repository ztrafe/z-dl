# z-dl

Dead-simple YouTube downloader for macOS.

Installs three Terminal commands:
- `ytmp3` → download MP3
- `ytwav` → download WAV
- `ytmp4` → download MP4

## Install
```sh
git clone https://github.com/ztrafe/z-dl.git && cd z-dl && ./install.sh && source ~/.zshrc
```

## Usage

Use quotes around URLs with special characters (`?` or `&`):
```bash
ytmp3 'https://youtu.be/VIDEO_ID'
ytwav 'https://youtu.be/VIDEO_ID'
ytmp4 'https://youtu.be/VIDEO_ID'
```

Examples:
```bash
ytmp3 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
ytmp4 'https://www.youtube.com/watch?v=dQw4w9WgXcQ&t=30s'
```

## What gets installed

- **Homebrew** (only if you don't already have it)
- **yt-dlp** (YouTube downloader)
- **ffmpeg** (audio/video conversion)
- **Download folders:**
  - `~/Music/z-dl/mp3/` - MP3 audio files
  - `~/Music/z-dl/wav/` - WAV audio files
  - `~/Movies/z-dl/mp4/` - MP4 video files
- **Shell commands** added to `~/.zshrc`:
  - `ytmp3`
  - `ytwav`
  - `ytmp4`

## Output locations

- **MP3:** `~/Music/z-dl/mp3/`
- **WAV:** `~/Music/z-dl/wav/`
- **MP4:** `~/Movies/z-dl/mp4/`

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

### MP4 quality

The script downloads the best available MP4 video quality. For smaller files, you can modify the command or use online converters.

## Uninstall

1. Open `~/.zshrc` and delete the `ytmp3`, `ytwav`, and `ytmp4` function definitions
2. (Optional) Uninstall dependencies:
```bash
   brew uninstall yt-dlp ffmpeg
```
3. (Optional) Remove downloaded files:
```bash
   rm -rf ~/Music/z-dl ~/Movies/z-dl
```

## Legal

Only download content you have the rights to use. Respect copyright and creator rights.

## Requirements

- macOS (tested on macOS 10.15+)
- Terminal with zsh (default on macOS Catalina and later)
