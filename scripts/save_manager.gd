extends Node

# If set to true, wipe files before loading them
var cleanup = false

func _ready():
    # Load options on boot
    load_data("options.save", "options")

# Note: This can be called from anywhere inside the tree.  This function is path independent.
# Go through everything in the persist category and ask them to return a dict of relevant variables
func save_data(data):
    var file = File.new()
    file.open("user://" + data.filename, File.WRITE)
    file.store_line(to_json(data))

# Note: This can be called from anywhere inside the tree. This function is path independent.
func load_data(filename, statename):
    var file = File.new()
    if cleanup:
        Directory.new().remove("user://" + filename)

    if not file.file_exists("user://" + filename):
        return # Error! We don't have a save to load.

    # Load the file
    file.open("user://" + filename, File.READ)

    var data = parse_json(file.get_line())
    for k in data.keys():
        global_state[statename][k] = data[k]

    file.close()