extends Node2D

@export var radius: float = 5.0
@export var color: Color = Color(0, 1, 0)  # 绿色

func _draw():
	var screen_size = get_viewport_rect().size
	draw_circle(screen_size / 2, radius, Color(0, 1, 0))  # 绿色圆点，半径为3

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	print("haha")
	var center = get_viewport_rect().size/2
	var x = center.x
	var y = center.y
	get_tree().root.mouse_passthrough_polygon = [
		Vector2(x,y),
		Vector2(x,y+radius),
		Vector2(x+radius,y+radius),
		Vector2(x+radius,y)
	]
	
