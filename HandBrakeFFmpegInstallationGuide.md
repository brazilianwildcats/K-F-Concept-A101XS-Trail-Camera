
# Installation Guide for HandBrakeCLI and FFmpeg on Windows

This guide will help you install **HandBrakeCLI** and **FFmpeg** on your Windows machine, and configure your script to ensure both `HandBrakeCLI.exe` and `ffprobe.exe` paths are correctly set.

### 1. Install HandBrakeCLI

1. Go to the official website:  
   👉 [https://handbrake.fr/downloads2.php](https://handbrake.fr/downloads2.php)

2. Look for the **"HandBrakeCLI"** (Command Line Interface) version.  
   **Note:** This is the command-line version, not the GUI version of HandBrake.

3. Download the **.zip** file for Windows.

4. Extract the **.zip** file to a folder on your computer, for example:  
   `C:\Program Files\HandBrakeCLI\`

5. After extraction, you should have a file named `HandBrakeCLI.exe` in this folder.

---

### 2. Install FFmpeg

1. Go to the official FFmpeg website:  
   👉 [https://ffmpeg.org/download.html](https://ffmpeg.org/download.html)

2. Click on **Get packages & executable files** and choose Windows.

3. It is recommended to download from **gyan.dev** or **BtbN builds**, as these provide reliable builds.

4. Download the **full build** package.

5. Extract the **.zip** file to a folder, for example:  
   `C:\Program Files\FFmpeg\`

6. Inside the extracted folder, you will find `ffprobe.exe` located at:  
   `C:\Program Files\FFmpeg\bin\ffprobe.exe`

---

### 3. Set Paths in Your Script

Now that you have the executables, you need to make sure your script knows where to find them.

In your script (PowerShell, Batch, or another language), you must specify the correct paths.

Here’s an example in **PowerShell**:

```powershell
# Define the correct paths
$handbrakePath = "C:\Program Files\HandBrakeCLI\HandBrakeCLI.exe"
$ffprobePath = "C:\Program Files\FFmpeg\bin\ffprobe.exe"

### 4. Add to Windows PATH

If you want Windows to **always recognize** `HandBrakeCLI` and `ffprobe` without specifying the full path:

1. Press `Windows + S` and type **"Environment Variables"**.
2. Click on **Edit the system environment variables**.
3. In the opened window, click on **Environment Variables**.
4. Under **System Variables**, find the **Path** variable and click **Edit**.
5. Click on **New** and add the following paths:
   - `C:\Program Files\HandBrakeCLI\`
   - `C:\Program Files\FFmpeg\bin\`

After doing this, you can call `HandBrakeCLI.exe` and `ffprobe.exe` from **anywhere** on your system (including in the terminal/command prompt).

---

### 5. Test the Installation

Open PowerShell or Command Prompt and type:

HandBrakeCLI --version
ffprobe -version
```

If both commands return version numbers, everything is working correctly.

---

### Summary

| Program         | Suggested Location                  | Required Executable   |
|:----------------|:------------------------------------|:-----------------------|
| HandBrakeCLI    | `C:\Program Files\HandBrakeCLI\`    | `HandBrakeCLI.exe`     |
| FFmpeg          | `C:\Program Files\FFmpeg\bin\`      | `ffprobe.exe` (found in `/bin`) |

---

Now you're ready to use both **HandBrakeCLI** and **FFmpeg** in your scripts! If you need any further assistance, feel free to ask. 🚀
