extends VBoxContainer

func _ready():
	pass
	


func _on_button_pressed():
	AudioServer.set_bus_volume_db(0 , linear_to_db($HSlider.value))
