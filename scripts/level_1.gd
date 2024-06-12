extends Node2D



func _ready()-> void:
	global.load_game_1()
# 
func _physics_process(delta: float)-> void:
	global.save_game_1()
	
