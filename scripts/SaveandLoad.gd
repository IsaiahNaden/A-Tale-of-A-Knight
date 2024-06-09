extends Node

func _ready():
	pass

func _process(delta):
	pass

func SaveGame(name):
	var dir = DirAccess.open("user://")
	if !dir.dir_exists("savedGames"):
		dir.make_dir("savedGames")
	dir = DirAccess.open("user://savedGames")
	
	var username = $GameManager.get_username()
	var saveData = {
		username: {
			"username": $GameManager.get_username(),
			"user_id": $GameManager.get_userid(),
			"scene": $GameManager.LoadedLevel,
			"spawnIndex": $GameManager.SpawnIndex
		}
	}

	var saveJson = JSON.stringify(saveData)
	var file = FileAccess.open("user://savedGames/" + username + ".json", FileAccess.WRITE)
	file.store_string(saveJson)
	file.close()

func LoadGame(name):
	var username = $GameManager.get_username()
	var file = FileAccess.open("user://savedGames/" + username + ".json", FileAccess.READ)
	if file.error != OK:
		print("Failed to open save file.")
		return
		
	var saveJson = file.get_as_text()
	var saveData = JSON.parse_string(saveJson)
	if saveData.error != OK:
		return
	
	var userData = saveData.result.get(name)
	if userData:
		$GameManager.get_username(userData["username"])
		$GameManager.get_userid(userData["user_id"])
		$GameManager.LoadedLevel = userData["scene"]
		$GameManager.SpawnIndex = userData["spawnIndex"]
	else:
		file.close()
