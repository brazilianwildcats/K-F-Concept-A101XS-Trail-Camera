# 🎞️ Video Converter with Metadata Logging (PowerShell + HandBrakeCLI)

This PowerShell script automates video conversion using HandBrakeCLI, with bitrate, size, and duration logging — all saved to a centralized log file.

## ✅ Features

- Converts `.avi` videos to H.264 `.mp4` using HandBrakeCLI
- Sets target bitrate, framerate, audio format and mono mixdown
- Increases audio volume (+20dB)
- Preserves file creation and modification timestamps
- Logs:
  - Original and converted size (MB)
  - Original and converted bitrate (Mb/s)
  - Duration of the conversion
  - Reduction percentage
  - Conversion success or failure

## 📁 Output Example

```
🎥 File:        DSCF0007.AVI
🕓 Start:       04/14/2025 19:51:31
🕔 End:         04/14/2025 19:51:53
⏱️ Duration:    00:00:22.0722946
📦 Original:    291.89 MB | ~82.42 Mb/s
📦 Converted:   52.06 MB | ~14.96 Mb/s
📉 Reduction:   82.17%
🎞️ FPS:         30
✅ Status:      Success
```

## ⚙️ Requirements

- [HandBrakeCLI](https://handbrake.fr/downloads2.php)
- [FFmpeg (for ffprobe)](https://ffmpeg.org/download.html)
- PowerShell 5.0 or later (Windows)

## 🛠️ How to Use

1. Install HandBrakeCLI and FFmpeg (ensure `HandBrakeCLI.exe` and `ffprobe.exe` paths are correct in the script).
2. Place the `.ps1` script in the same folder as your `.avi` files.
3. Open PowerShell and run:
   ```powershell
   .\converter.ps1
   ```
4. The script will generate a `conversion-log.txt` file in the same directory.

## 📜 License

MIT License. See [`LICENSE`](LICENSE) for details.
