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
		"username": $GameManager.get_username(),
		"user_id": $GameManager.get_userid(),
		"scene": $GameManager.LoadedLevel,
		"spawnIndex": $GameManager.SpawnIndex
	}

	var saveJson = JSON.stringify(saveData)
	var file = FileAccess.open("user://savedGames/" + username + ".json", FileAccess.WRITE)
	file.store_string(saveJson)
	file.close()

func LoadGame(name):
	var file = FileAccess.open("user://savedGames/" + name + ".json", FileAccess.READ)
	if file.error != OK:
		return
	
	var saveJson = file.get_as_text()
	var json_parser = JSON.new()
	var parse_result = json_parser.parse_string(saveJson)
	if parse_result != OK:
		return
	
	var saveData = json_parser.get_data()
	if saveData:
		$GameManager.username = saveData["username"]
		$GameManager.user_id = saveData["user_id"]
		$GameManager.LoadedLevel = saveData["scene"]
		$GameManager.SpawnIndex = saveData["spawnIndex"]
	else:
		print("No data found for user:", name)
	file.close()
