extends TextureRect

@export var mic_on: bool = true:
	set(value):
		mic_on = value
		update_mic()

func update_mic():
	var script_dir = get_script().resource_path.get_base_dir()
	var exe_path = ProjectSettings.globalize_path("res://scripts/SoundVolumeView.exe")
	if mic_on:
		self.texture = load("res://icons/mic_on.png")
		OS.execute(exe_path, ["/Unmute", "耳机式麦克风"])
	else:
		self.texture = load("res://icons/mic_off.png")
		OS.execute(exe_path, ["/Mute", "耳机式麦克风"])
	
