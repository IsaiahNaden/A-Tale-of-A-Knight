extends CharacterBody2D

var speed = 40
var player_chase = false
var player = null

var enemy

var health = 100
var player_inattack_range = false
var can_take_damage = true

func _physics_process(delta):

	
	if player_chase:
		position += (player.position - position)/speed
		
		$princess_animation.play("idle")
	else: 
		$princess_animation.play("idle")


func _on_area_2d_area_entered(area):
	get_tree().change_scene_to_file("res://scenes/victory.tscn")
