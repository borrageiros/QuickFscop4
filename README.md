<div align="center">

<img src="media/f4st.png" alt="F4ST Icon" width="128" height="128">

# F4ST

**A Windows utility that allows you to forcefully terminate applications using keyboard shortcuts**

*Based on [SuperF4](https://github.com/stefansundin/superf4) by Stefan Sundin*

</div>

## What is F4ST? 🚀

F4ST is a lightweight Windows application that runs in the system tray and provides powerful shortcuts to kill unresponsive or frozen applications. It's perfect for when regular Alt+F4 doesn't work!

## Features ✨

- **Ctrl+Alt+F4** - Forcefully terminate the active window
- **Win+F4** - Activate xkill mode (click on any window to kill it)
- **System tray integration** - Runs quietly in the background
- **Process denylist** - Protect important processes from accidental termination
- **Auto-start option** - Launch with Windows automatically

## Keyboard Shortcuts ⌨️

| Shortcut | Action |
|----------|--------|
| `Ctrl+Alt+F4` | Kill the currently active window |
| `Win+F4` | Activate xkill mode (cursor changes to skull) |
| `Left Click` (in xkill mode) | Kill the window you click on |
| `Right Click` (in xkill mode) | Cancel xkill mode |
| `Escape` (in xkill mode) | Cancel xkill mode |

## Context Menu Options 📋

Right-click the system tray icon to access the following options:

### Main Options

- **🔄 Disable** - Temporarily disable F4ST. The keyboard hooks are removed, and shortcuts won't work until you enable it again.

- **⬆️ Elevate** - Restart F4ST with administrator privileges. Required to kill processes running with elevated permissions.

- **💀 xkill** - Activate xkill mode. Your cursor changes to a skull, and you can click on any window to forcefully terminate it. Press Escape or right-click to cancel.

- **❌ Exit** - Close F4ST completely.

### Options Submenu

- **🚀 Autostart** - Toggle whether F4ST should start automatically with Windows.

- **⬆️ Elevate on autostart** - If enabled, F4ST will request administrator privileges when starting with Windows.

- **⏱️ TimerCheck** - Enable an alternative detection method for Ctrl+Alt+F4. By default, F4ST uses keyboard hooks to detect the shortcut. Some applications (especially games like StarCraft II) block these hooks to prevent keyloggers, which also prevents F4ST from working. When TimerCheck is enabled, F4ST additionally checks the keyboard state every 50ms using a timer, allowing it to detect Ctrl+Alt+F4 even when hooks are blocked. **Enable this if Ctrl+Alt+F4 doesn't work on a specific application.**

- **📝 Open Ini file** - Open the configuration file (`F4ST.ini`) in your default text editor. You can configure process denylist and other advanced settings here.

- **🌐 Open website** - Open the F4ST website in your default browser.

## Configuration ⚙️

The configuration file `F4ST.ini` allows you to customize:

- **ProcessDenylist** - Comma-separated list of processes that should never be killed (e.g., `explorer.exe`)
- **TimerCheck** - Enable/disable timer-based key detection
- **AlwaysElevate** - Always request administrator privileges on startup

## Installation 📦

1. Download the latest release
2. Run the installer or extract the executable
3. F4ST will start automatically and appear in your system tray

## Requirements 💻

- Windows Vista or later
- Administrator privileges (optional, but required to kill elevated processes)

## License 📄

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This is a modified version of SuperF4 by Stefan Sundin.

## Credits 🙏

- Original work: Stefan Sundin (2019)
- Modified by: borrageiros (2025)

