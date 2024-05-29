extends CharacterBody2D

@export var speed : int = 150

func UserInput():
	var MovementDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = MovementDirection * speed
	
func _physics_process(_delta):
	UserInput()
	move_and_slide()
	
 
