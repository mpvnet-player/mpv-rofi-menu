
----- mpv-rofi-menu

utils = require "mp.utils"
msg = require "mp.msg"
envlist = utils.get_env_list()

mp.register_script_message("show-rofi-menu", function (mode)
    if mode == "bindings" then
        table.insert(envlist, "mpv_rofi_menu_mode=bindings")
        table.insert(envlist, "mpv_rofi_menu_bindings=" .. mp.get_property("input-bindings"))
    else
        msg.error("Unknown mode, supported modes are: bindings")
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
