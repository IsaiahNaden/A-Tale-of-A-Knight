extends Node2D


func _ready()-> void:
	AudioPlayer.play_music_level()
	global.load_game_1()

# 
func _physics_process(delta: float)-> void:
	global.save_game_1()
	


