#!/usr/bin/env python3

import os
import json
import sys
import socket
import pathlib

def execute(cmd):
    socket_name = "/tmp/mpvsocket"
    if os.path.exists(socket_name):
        client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        client.connect(socket_name)
        client.send(cmd.encode('utf-8'))
        client.close()
    else:
        print("Error mpv-rofi-menu: /tmp/mpvsocket socket does not exist")

def bindings():
    json_list = json.loads(os.getenv("mpv_rofi_menu_bindings"))
    for i in json_list:
        cmd = i.get("cmd")
        if cmd == None or cmd == "" or cmd == "ignore":
            continue
        comment = i.get("comment")
        key = i.get("key")
        text = comment
        if text == None or text == "":
            text = cmd
        text = text + " (" + key + ")"
        if len(sys.argv) == 2 and sys.argv[1] == text:
            execute(cmd + "\n")
            break
        elif len(sys.argv) == 1:
            print(text)

def playlist():
    playlist_text = os.getenv("mpv_rofi_menu_playlist")
    playlist_lines = playlist_text.splitlines()
    for x in range(0, len(playlist_lines)):
        text = pathlib.Path(playlist_lines[x]).name
        if len(sys.argv) == 1:
            print(text)
        elif len(sys.argv) == 2 and sys.argv[1] == text:
            execute("no-osd set playlist-pos " + str(x) + "\n")
            break

mode = os.getenv("mpv_rofi_menu_mode")

if mode == "bindings":
    bindings()
elif mode == "playlist":
    playlist()
