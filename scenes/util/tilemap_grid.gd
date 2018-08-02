extends Node2D

var tilemaps = []

func _ready():
    var parent = get_parent()

    if parent != null:
        for c in parent.get_children():
            if c is TileMap:
                tilemaps.append(c)

func _draw():
    for i in range (0, tilemaps.size()):
        var tilemap = tilemaps[i]
        var dims = tilemap.get_used_rect()

        var c = i / (tilemaps.size() - 1)
        var color = Color(c, c, c)

        draw_set_transform(dims.position * tilemap.cell_size, 0, tilemap.cell_size)

        for y in range(0, dims.size.y):
            draw_line(Vector2(0, y), Vector2(dims.size.x, y), color)

        for x in range(0, dims.size.x):
            draw_line(Vector2(x, 0), Vector2(x, dims.size.y), color)