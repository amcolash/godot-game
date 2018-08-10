extends Node

# Note: The global state will be set before the save manager loads,
# This ensures that missing state (from save) will be defaulted correctly

var options = {
    "filename": "options.save",
    "music": true,
    "sfx": true,
    "vsync": true
}

var save = {
    "filename": "save1.save",
    "current_scene": null,
    "position": null
}

var Root = null
var Player = null

# Called after a load to set things up
func post_load_init():
    OS.set_use_vsync(options.vsync);