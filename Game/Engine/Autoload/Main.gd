extends Node

var game_file = "res://savegame.save"

# warning-ignore:unused_class_variable
var showfps = true
# warning-ignore:unused_class_variable
var autosave = true
# warning-ignore:unused_class_variable
var inpausemenu = false
# warning-ignore:unused_class_variable
var inoptions = false

func load_game():
	var f = File.new()
	if f.file_exists(game_file):
		f.open(game_file, File.READ)
		Game.level001 = f.get_var()
		Game.level001_obj = f.get_var()
		Game.level002 = f.get_var()
		Game.level002_obj = f.get_var()
		Game.level003 = f.get_var()
		Game.level003_obj = f.get_var()
		Player.klasse = f.get_var()
		Player.gender = f.get_var()
		Player.lastlevel = f.get_var()
		Game.total_time = f.get_var()
		Game.highscore = f.get_var()
		f.close()
		#print(Player.klasse, Player.gender)
		Player.loadplayer(Player.klasse, Player.gender)

func save():
	var f = File.new()
	f.open(game_file, File.WRITE)
	f.store_var(Game.level001)
	f.store_var(Game.level001_obj)
	f.store_var(Game.level002)
	f.store_var(Game.level002_obj)
	f.store_var(Game.level003)
	f.store_var(Game.level003_obj)
	f.store_var(Player.klasse)
	f.store_var(Player.gender)
	f.store_var(Player.lastlevel)
	f.store_var(Game.total_time)
	f.store_var(Game.highscore)
	f.close()