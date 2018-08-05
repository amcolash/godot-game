extends Node

# Note: The global state will be set before the save manager loads,
# This ensures that missing state (from save) will be defaulted correctly

var options = {
    "filename": "options.save",
    "music": true,
    "sfx": true,
    "vsync": true
}

var game = {
    "filename": "save1.save",
    "current_scene": null,
    "position": null
}

# Called after a load to set some special things up
func post_load_init():
    OS.set_use_vsync(options.vsync);