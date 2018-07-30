extends Node

var stack = []

func _ready():
    # If the game was started by the main scene then push it (real good) onto the stack
    var name = get_tree().get_current_scene().get_path().get_name(1)
    if name.casecmp_to("Title Screen") == 0:
        stack.push_front(ProjectSettings.get_setting("application/run/main_scene"))

func push_scene(scenePath):
    var file = File.new()
    if not file.file_exists(scenePath):
        print("ERROR: Scene does not exist - " + scenePath)
        return

    print("pushed scene: " + scenePath)
    stack.push_front(scenePath)
    get_tree().change_scene(scenePath)

func pop_scene():
    if stack.size() > 1:
        print ("popped scene: " + stack.pop_front())
        get_tree().change_scene(stack.front())
    else:
        print("popping parent of stack, killing game")
        get_tree().quit()
