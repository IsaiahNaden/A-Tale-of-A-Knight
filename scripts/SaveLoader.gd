extends Node

func _ready():
	pass
	
func _process(delta):
	pass
	
func SaveGame(name):
	var dir = DirAccess.open("user://")
	if !dir.dir_exists("savedGames"):
		dir.make_dir("savesGames")
	dir = DirAccess.open("user://saveGames")

var saveData = {}
