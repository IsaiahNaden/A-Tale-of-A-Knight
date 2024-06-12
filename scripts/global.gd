extends Node

var player_current_attack = false

#world cliff_side
var transition_scene = false

var player_respawn_posx = 200
var player_respawn_posy = 28
var player_start_posx = 50
var player_start_posy = 143

var game_first_loadin = true


const save_dir: String = 'res://savegame.bin'

func save_game_1() -> void:
	
	var file  = FileAccess.open(save_dir, FileAccess.WRITE)
	var player_level_1 = get_node('/root/level_1_start/player')
	var data: Dictionary = {
		
		 "position.x" : player_level_1.position.x,
		 "position.y" : player_level_1.position.y,
		

	}
	
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
	
func load_game_1()-> void:
	
	var file = FileAccess.open(save_dir, FileAccess.READ)
	if not file:
		return
	if FileAccess.file_exists(save_dir) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			var player_level_1 = get_node('/root/level_1_start/player')		
			
			if current_line:
				player_level_1.position.x = int(current_line["position.x"])
				player_level_1.position.y = int(current_line["position.y"])
				
				
				
				
				
				
func save_game_2() -> void:
	
	var file  = FileAccess.open(save_dir, FileAccess.WRITE)
	var player_level_2 = get_node('/root/level_2/player')
	var data: Dictionary = {
		
		 "position.x" : player_level_2.position.x,
		 "position.y" : player_level_2.position.y,
		

	}
	
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
	
	
	
func load_game_2()-> void:
	
	var file = FileAccess.open(save_dir, FileAccess.READ)
	if not file:
		return
	if FileAccess.file_exists(save_dir) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			var player_level_2 = get_node('/root/level_2/player')		
			
			if current_line:
				player_level_2.position.x = int(current_line["position.x"])
				player_level_2.position.y = int(current_line["position.y"])
				
				

func save_game_3() -> void:
	
	var file  = FileAccess.open(save_dir, FileAccess.WRITE)
	var player_level_3 = get_node('/root/level_4/player')
	var data: Dictionary = {
		
		 "position.x" : player_level_3.position.x,
		 "position.y" : player_level_3.position.y,
		

	}
	
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
	
	
func load_game_3()-> void:
	
	var file = FileAccess.open(save_dir, FileAccess.READ)
	if not file:
		return
	if FileAccess.file_exists(save_dir) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			var player_level_3 = get_node('/root/level_4/player')		
			
			if current_line:
				player_level_3.position.x = int(current_line["position.x"])
				player_level_3.position.y = int(current_line["position.y"])
				
	
