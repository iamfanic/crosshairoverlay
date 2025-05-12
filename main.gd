extends Node


func _ready():
	print("程序启动1")
	get_tree().root.set_transparent_background(true)
	var screen_size = DisplayServer.screen_get_size(0)
	$Mic.position = Vector2(0, 0)
	#$Crosshair.position = Vector2(screen_size.x/2 - $Crosshair.size.x, screen_size.y/2 - $Crosshair.size.y)
	
	
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		var script_dir = get_script().resource_path.get_base_dir()
		var exe_path = ProjectSettings.globalize_path(script_dir + "/SoundVolumeView.exe")
		OS.execute(exe_path, ["/Unmute", "耳机式麦克风"])
