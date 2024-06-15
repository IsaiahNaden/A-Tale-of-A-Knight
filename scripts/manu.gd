extends Node2D

func _ready():
	$BlackTexture.hide()
	$tips_tittle.hide()
	$move.hide()
	$move2.hide()
	$back.hide()
	$move3.hide()
	


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/dialogue.tscn")


func _on_tips_pressed():
	$Tips.hide()
	$Background.hide()
	$Game_name.hide()
	$Start.hide()
	$Start2.hide()
	$back.show()
	$BlackTexture.show()
	$tips_tittle.show()
	$move.show()
	$move2.show()
	$move3.show()
	
	


func _on_start_2_pressed():
	get_tree().quit()


func _on_back_pressed():
	
	$Tips.show()
	$Background.show()
	$Game_name.show()
	$Start.show()
	$Start2.show()
	$back.hide()
	$BlackTexture.hide()
	$tips_tittle.hide()
	$move.hide()
	$move2.hide()
	$move3.hide()
	
