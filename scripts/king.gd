extends CharacterBody2D

var speed = 40
var player_chase = false
var player = null

var health = 100
var player_inattack_range = false
var can_take_damage = true
	
	
func _physics_process(_delta):
	if player_chase:
		position += (player.position - position)/speed
		
		$king_animation.play("idle")
	else: 
		$king_animation.play("idle")
		
func _ready():
	$dialogue.hide()
	$">>>_1".hide()
	$dialogue2.hide()
	$">>>_2".hide()
	$dialogue3.hide()
	$">>>_3".hide()
	$dialogue4.hide()
	$"next>".hide()
	$GoodLuck.hide()
	


func _on_area_2d_area_entered(area):
	get_tree().paused = !get_tree().paused
	global.game_first_loadin = false
	get_tree().change_scene_to_file("res://scenes/dialogue2.tscn")
	
