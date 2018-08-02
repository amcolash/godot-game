extends Node2D

var tilemaps = []
var colors = [
    Color(0, 0, 0),
    Color(1, 0, 0),
    Color(0, 0, 1),
    Color(0, 1, 0),
    Color(1, 1, 1)
]

func _ready():
    append_recursive(get_parent())
    print(tilemaps)

func append_recursive(parent):
    if parent != null:
        for c in parent.get_children():
            append_recursive(c)
            if c is TileMap:
                tilemaps.append(c)

func _draw():
    for i in range (0, tilemaps.size()):
        var tilemap = tilemaps[i]
        var bounds = tilemap.get_used_rect()

        var position = bounds.position * tilemap.cell_size
        var dimensions = bounds.size * tilemap.cell_size

        var color = colors[i]

        for x in range(position.x, position.x + dimensions.x, tilemap.cell_size.x):
            draw_line(Vector2(x, position.y), Vector2(x, position.y + dimensions.y), color)

        for y in range(position.y, position.y + dimensions.y, tilemap.cell_size.y):
            draw_line(Vector2(position.x, y), Vector2(position.x + dimensions.x, y), color)