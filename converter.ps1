# Paths
$handbrake = "C:\Program Files\HandBrake\HandBrakeCLI.exe"
$ffprobe = "C:\ffmpeg\bin\ffprobe.exe"  # Change this path if needed
$logPath = "conversion-log.txt"

# Start log
"🔧 Conversion Log - $(Get-Date)" | Out-File -FilePath $logPath -Encoding UTF8

# Get all AVI files in current directory
$videos = Get-ChildItem -Path "." -Filter *.avi

foreach ($video in $videos) {
    $input = $video.FullName
    $outputName = [System.IO.Path]::GetFileNameWithoutExtension($video.Name) + "_H264_15Mbps.mp4"
    $output = Join-Path $video.DirectoryName $outputName

    Write-Host "`n🔄 Converting: $video.Name"
    $startTime = Get-Date

    # Run conversion
    & $handbrake `
        "-i", $input `
        "-o", $output `
        "-e", "x264" `
        "-b", "15000" `
        "--multi-pass" `
        "--turbo" `
        "--encoder-preset", "slow" `
        "--encoder-tune", "film" `
        "--start-at", "duration:1" `
        "--aencoder", "av_aac" `
        "--ab", "256" `
        "--mixdown", "mono" `
        "--arate", "32000" `
        "--gain", "20" `
        "--format", "av_mp4" `
        "--optimize" `
        "--rate", "30" `
        "--cfr"

    $endTime = Get-Date
    $conversionDuration = $endTime - $startTime

    if (Test-Path $output) {
        # Preserve timestamps
        $original = Get-Item $input
        $converted = Get-Item $output
                try {
            $original = Get-Item $input
            $converted = Get-Item $output

            $converted.CreationTime = $original.CreationTime
            $converted.LastWriteTime = $original.LastWriteTime

            Write-Host "🗂️  Metadata copied: CreationTime and LastWriteTime preserved."
        } catch {
            Write-Host "⚠️  Failed to copy timestamps: $($_.Exception.Message)"
        }

        # File sizes
        $originalSizeMB = [math]::Round($original.Length / 1MB, 2)
        $convertedSizeMB = [math]::Round($converted.Length / 1MB, 2)
        $reduction = [math]::Round((1 - ($converted.Length / $original.Length)) * 100, 2)

        # Bitrates (in Mb/s)
        $bitrateOriginal = & $ffprobe -v error -select_streams v:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1:nokey=1 "$input"
        $bitrateConverted = & $ffprobe -v error -select_streams v:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1:nokey=1 "$output"
        $bitrateOriginal = [math]::Round(($bitrateOriginal / 1000000), 2)
        $bitrateConverted = [math]::Round(($bitrateConverted / 1000000), 2)

        # Final log block
        $logEntry = @"
🎥 File:        $($video.Name)
🕓 Start:       $startTime
🕔 End:         $endTime
⏱️ Duration:    $($conversionDuration.ToString())
📦 Original:    ${originalSizeMB} MB | ~${bitrateOriginal} Mb/s
📦 Converted:   ${convertedSizeMB} MB | ~${bitrateConverted} Mb/s
📉 Reduction:   ${reduction}%
🎞️ FPS:         30
✅ Status:      Success
"@

        Write-Host $logEntry
        $logEntry | Out-File -FilePath $logPath -Append -Encoding UTF8
    }
    else {
        $failLog = @"
🎥 File:        $($video.Name)
🕓 Start:       $startTime
🕔 End:         $(Get-Date)
⏱️  Duration:   ERROR
❌ Status:      Failed to convert
"@
        Write-Host $failLog
        $failLog | Out-File -FilePath $logPath -Append -Encoding UTF8
    }
}
