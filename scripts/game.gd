extends Node2D


func _ready():
	$interface/manu.show()
	$interface/dialogue.hide()
	$interface/dailgue1.hide()
	$interface/dialogue2.hide()
	
func _process(delta):
	if Input.is_action_just_pressed("esc") :
		$Saveandload.SaveGame("test")
		pass
func LoadLevel():
	pass
