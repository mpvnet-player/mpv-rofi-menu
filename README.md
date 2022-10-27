
# mpv-rofi-menu

mpv-rofi-menu allows to control mpv player using Rofi, which is a popular keystroke Launcher for Linux.

Two moded are currently supported:

1. Input bindings
2. Playlist

## Requirements

- Linux and X11 (for Wayland there is wofi)
- mpv player
- Rofi launcher
- Python 3

## input.conf

`F1 script-message-to mpv_rofi_menu show-rofi-menu bindings`
`F8 script-message-to mpv_rofi_menu show-rofi-menu playlist`

## Location of Python file

`~/.config/rofi/mpv-rofi-menu.py`

## Screenshot

![screenshot](screenshot.png)

## Related projects:

- https://github.com/Seme4eg/mpv-scripts/tree/master#m-x
- https://github.com/CogentRedTester/mpv-search-page
- https://github.com/stax76/mpv-scripts/blob/main/osm.lua
- https://github.com/mpvnet-player/mpv.net#command-palette
  - https://github.com/mpvnet-player/mpv.net/blob/master/docs/Manual.md#command-palette
- https://albertlauncher.github.io
- https://github.com/Flow-Launcher/Flow.Launcher
- https://gist.github.com/avih/bee746200b5712220b8bd2f230e535de
- https://github.com/nezumisama/mpvmenu
- https://gitlab.com/carmanaught/mpvcontextmenu
