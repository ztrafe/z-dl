# z-dl

Dead-simple YouTube audio downloader for macOS.

Installs two Terminal commands:
- `ytmp3` → download MP3
- `ytwav` → download WAV

No quotes required, even for URLs with `?` or `&`.

## TL;DR
```bash
git clone https://github.com/ztrafe/z-dl.git
cd z-dl
./install.sh
source ~/.zshrc
```

**Use:**
```bash
ytmp3 https://youtu.be/VIDEO_ID
ytwav https://youtu.be/VIDEO_ID
```

## What this installs

- Homebrew (only if you don't already have it)
- yt-dlp
- ffmpeg
- Two download folders:
  - `~/Music/yt-dl` (MP3)
  - `~/Music/yt-dl-wav` (WAV)
- Two shell commands added to `~/.zshrc`:
  - `ytmp3`
  - `ytwav`

## Where files go

- **MP3:** `~/Music/yt-dl`
- **WAV:** `~/Music/yt-dl-wav`

## Common issues

**Command not found**
- Restart Terminal, or run:
```bash
  source ~/.zshrc
```

**Permission denied when running install.sh**
```bash
chmod +x install.sh
```

**WAV files are large**
- This is expected. WAV is uncompressed and intended for DAWs like Logic Pro.

## Uninstall

1. Open `~/.zshrc` and delete the `ytmp3` and `ytwav` lines
2. Optional: uninstall dependencies
```bash
   brew uninstall yt-dlp ffmpeg
```
3. Optional: remove downloaded files
```bash
   rm -rf ~/Music/yt-dl ~/Music/yt-dl-wav
```

## Notes

Only download content you have the rights to.
