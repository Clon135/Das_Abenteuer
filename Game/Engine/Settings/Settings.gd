extends Resource
class_name Settings

export(String) var settingsfile = "res://settings.save"

# warning-ignore:unused_class_variable
export(float) var musik = 0.0
# warning-ignore:unused_class_variable
export(float) var effekts = 0.0

# warning-ignore:unused_class_variable
export(bool) var showfps = false
# warning-ignore:unused_class_variable
export(bool) var fullscreen = false
# warning-ignore:unused_class_variable
export(bool) var borderless = false
# warning-ignore:unused_class_variable
export(bool) var vsync = true
# warning-ignore:unused_class_variable
export(bool) var autosave = true



func load_settings():
	
	var f = File.new()
	if f.file_exists(settingsfile):
		f.open(settingsfile, File.READ)
		musik = f.get_var()
		effekts = f.get_var()
		showfps = f.get_var()
		fullscreen = f.get_var()
		borderless = f.get_var()
		vsync = f.get_var()
		autosave = f.get_var()
		f.close()
	else:
		musik = -40
		effekts = -40
		showfps = false
		fullscreen = false
		borderless = false
		vsync = true
		autosave = true
	
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musik"), musik)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effekte"), effekts)
	OS.set_window_fullscreen(fullscreen)
	OS.set_borderless_window(borderless)
	OS.set_use_vsync(vsync)
	
	#print(musik, effekts, showfps, fullscreen, borderless, vsync, autosave)

func save_settings():
	
	var f = File.new()
	f.open(settingsfile, File.WRITE)
	f.store_var(musik)
	f.store_var(effekts)
	f.store_var(showfps)
	f.store_var(fullscreen)
	f.store_var(borderless)
	f.store_var(vsync)
	f.store_var(autosave)
	f.close()

