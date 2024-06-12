extends Node2D



func _ready():
	pass 

func _process(delta):
	pass


func _on_menu_pressed():
	get_tree().change_scene_to_file('res://scenes/manu.tscn')


func _on_respawn_pressed():
	get_tree().change_scene_to_file('res://scenes/level_1.tscn')
