extends Node


func SaveGame():
	var dir = DirAccess.open("user://")
	if !dir.dir_exists("savedGames"):
		dir.make_dir("savedGames")
	dir = DirAccess.open("user://savedGames")
	
	var username = $interface/dailgue1.username
	var saveData = { 
		username :{
		"username": $interface/dailgue1.username,
		"user_id": $interface/dailgue1.userid,
		"position": $"../base_game/MainCharacter".position , 
		"scene" : $GameManager.LoadLevel()

		}
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
	file.close()
