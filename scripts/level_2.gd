extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready()-> void:
	global.load_game_2()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float)-> void:
	global.save_game_2()
