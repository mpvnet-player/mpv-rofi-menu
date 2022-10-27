
----- mpv-rofi-menu

utils = require "mp.utils"
msg = require "mp.msg"

mp.register_script_message("show-rofi-menu", function (mode)
    if mode == "bindings" then
        envlist = utils.get_env_list()
        table.insert(envlist, "mpv_rofi_menu_mode=bindings")
        table.insert(envlist, "mpv_rofi_menu_bindings=" .. mp.get_property("input-bindings"))
    elseif mode == "playlist" then
        local count = mp.get_property_number("playlist-count")

        if count == 0 then
            return
        end

        local playlist = {}

        for i=0,(count - 1) do
            local filename = mp.get_property("playlist/" .. i .. "/filename")
            table.insert(playlist, filename)
        end

        local playlist_text =  table.concat(playlist, "\n")
        envlist = utils.get_env_list()
        table.insert(envlist, "mpv_rofi_menu_mode=playlist")
        table.insert(envlist, "mpv_rofi_menu_playlist=" .. playlist_text)
    else
        msg.error("Unknown mode '" .. mode .. "', supported is: 'bindings', 'playlist'.")
        return
    end

    mp.command_native({
        name = "subprocess",
        playback_only = false,
        detach = true,
        env = envlist,
        args = { 'rofi', '-modi', mode .. ':~/.config/rofi/mpv-rofi-menu.py', '-show', mode },
    })
end)
