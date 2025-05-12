extends TextureRect

@export var mic_on: bool = true:
	set(value):
		mic_on = value
		update_mic()

func update_mic():
	var script_dir = get_script().resource_path.get_base_dir()
	var exe_path = ProjectSettings.globalize_path(script_dir + "/SoundVolumeView.exe")
	if mic_on:
		self.texture = load("res://icons/mic_on.png")
		OS.execute("C:\\Users\\iamfa\\Desktop\\soundvolumeview-x64\\SoundVolumeView.exe", ["/Unmute", "耳机式麦克风"])
	else:
		self.texture = load("res://icons/mic_off.png")
		OS.execute("C:\\Users\\iamfa\\Desktop\\soundvolumeview-x64\\SoundVolumeView.exe", ["/Mute", "耳机式麦克风"])
	print(get_parent().position)
	
#func _draw():
	#var screen_size = get_viewport_rect().size
	#draw_circle(screen_size / 2, 4, Color(0, 1, 0))  # 绿色圆点，半径为3
		#
#func _process(delta):
	#queue_redraw()
