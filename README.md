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
🎥 File:        example_video.avi
🕓 Start:       2025-04-14 14:12:01
🕔 End:         2025-04-14 14:15:39
⏱️  Duration:   00:03:38
📦 Original:    350 MB | ~8.2 Mb/s
📦 Converted:   160 MB | ~3.7 Mb/s
📉 Reduction:   54.3%
🎯 Target BR:   15 Mb/s
🎞️  FPS:        30
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
