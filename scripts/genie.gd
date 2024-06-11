extends CharacterBody2D

var speed = 40
var player_chase = false
var player = null

var health = 100
var player_inattack_range = false
var can_take_damage = true

func _physics_process(delta):

	
	if player_chase:
		position += (player.position - position)/speed
		
		$genie_animation.play("idle")
	else: 
		$genie_animation.play("idle")
