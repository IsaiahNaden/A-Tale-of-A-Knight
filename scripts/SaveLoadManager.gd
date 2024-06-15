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
	
	var saveData = {
		"game":{
			"scene": $"../GameManager".LoadedLevel , 
			"spawnIndex" : $"../GameManager".SpawnIndex
		}
	}
	
	var saveJson = JSON.stringify(saveData)
	
	var file = FileAccess.open("user://savedGames/"+name+".json", FileAccess.WRITE)
	file.store_string(saveJson)
	
	
	
	
	
	
	
	
	
