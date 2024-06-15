extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	global.load_game_3()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global.save_game_3()
