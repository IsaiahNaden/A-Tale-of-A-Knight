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
	
	var username = $GameManager.get_username()
	var saveData = {
		username :{
			"username" : $GameManager.get_username,
			"user_id" : $GameManager.get_userid ,
			"scene": $GameManager.LoadedLevel , 
			"spawnIndex" :$GameManager.SpawnIndex
		}
	}

	var saveJson = JSON.stringify(saveData)

	var file = FileAccess.open("user://savedGames/"+username+".json", FileAccess.WRITE)
	file.store_string(saveJson)
	
func LoadGame():
	var username = $GameManager.get_username()
	var file = FileAccess.open("user://savedGames/" + username +".json" , FileAccess.READ)
