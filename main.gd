extends Node

	
func _ready():
	print("程序启动")
	get_tree().root.set_transparent_background(true)
	var screen_size = DisplayServer.screen_get_size(0)
	var center = screen_size/2
	$Mic.position = Vector2(0, 0)
	$Crosshair.position = Vector2(center.x, center.y)
	OS.create_process(ProjectSettings.globalize_path("res://scripts/hideInactiveCursor.exe"), [], false)

	
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		OS.execute(ProjectSettings.globalize_path("res://scripts/SoundVolumeView.exe"), ["/Unmute", "耳机式麦克风"])
		var stop_file_path := ProjectSettings.globalize_path("res://scripts/stop_signal.txt")
		var file = FileAccess.open(stop_file_path, FileAccess.WRITE)
		file.store_string("stop")  # 内容不重要
		file.close()
