extends Node2D

func _ready():
	$tips.hide()
	$move.hide()
	$other.hide()
	$rules.hide()
	$Background.show()
	$GameName.show()
	$VBoxContainer.show()
	$back.hide()

func _on_how_to_play_pressed():
	$Background.hide()
	$GameName.hide()
	$VBoxContainer.hide()
	$tips.show()
	$move.show()
	$other.show()
	$rules.show()
	$back.show()
	
func _on_back_pressed():
	$tips.hide()
	$move.hide()
	$other.hide()
	$rules.hide()
	$Background.show()
	$GameName.show()
	$VBoxContainer.show()
	$back.hide()
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/dialogue.tscn")

func _on_exit_pressed():
	get_tree().quit()
	
	


