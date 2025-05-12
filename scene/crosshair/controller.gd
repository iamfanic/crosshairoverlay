extends Polygon2D

var show_crosshair := true
			
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _draw():
	if show_crosshair:
		var screen_size = get_viewport_rect().size
		draw_circle(screen_size / 2, 2, Color(0, 1, 0))  # 绿色圆点，半径为3

func _process(delta):
	var has_joy = Input.get_connected_joypads().size() > 0
	if has_joy:
		var joy_id = Input.get_connected_joypads()[0]
		var l2_value = Input.get_joy_axis(joy_id, JOY_AXIS_TRIGGER_LEFT)
		if l2_value > 0.2:
			if show_crosshair:
				show_crosshair = false
		else:
			
			if not show_crosshair:
				show_crosshair = true
	
		var guid_value = Input.is_action_just_pressed("ps_button")
		if guid_value:
			var mic_icon = get_tree().get_root().get_node("Main/Mic/MicIcon")
			if mic_icon.mic_on:
				mic_icon.mic_on = false
			else:
				mic_icon.mic_on = true
	queue_redraw()
