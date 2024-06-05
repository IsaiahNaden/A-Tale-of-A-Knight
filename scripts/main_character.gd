extends CharacterBody2D

@export var speed = 150 

func user_input ():
	var movement_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = movement_direction * speed
	
func _physics_process(delta):
	user_input()
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("Teleport basement") :
		position.x = 575
		position.y = 190
