extends Node

func _ready():
    var parent = get_parent()
    var n = []
    for c in parent.get_children():
        if c extends TileMap:
            n.append(c)

func _draw():
    draw_set_transform(Vector2(), 0, tile_size)

    for y in range(0, tilemap_height):
        draw_line(Vector2(0, y), Vector2(tilemap_width, y), line_color)

    for x in range(0, tilemap_width):
        draw_line(Vector2(x, 0), Vector2(x, tilemap_height), line_color)