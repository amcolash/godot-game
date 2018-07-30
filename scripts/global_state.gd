extends Node

# Note: The global state will be set before the save manager loads,
# This ensures that missing state (from save) will be defaulted correctly

var options = {
    "filename": "options.save",
    "music": true,
    "sfx": true
}

var game = {
    "filename": "save1.save",
    "current_scene": null,
    "position": null
}