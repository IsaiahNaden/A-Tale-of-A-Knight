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
	$dialogue.show()
	$dialogue/Label.show()
	$dialogue/dialogue.show()
	$">>>_1".show()



var show_time = 2
func _on_area_2d_area_exited(area):
	$GoodLuck.show()
	$Timer.set_wait_time(show_time)
	$Timer.start()
	
	

func _on_timer_timeout():
	$GoodLuck.hide()

func _on__1_pressed():
	$dialogue/dialogue.hide()
	$dialogue2.show()
	$">>>_1".hide()
	$">>>_2".show()
	
	
func _on__2_pressed():
	$">>>_2".hide()
	$dialogue2.hide()
	$dialogue3.show()
	$">>>_3".show()


func _on_next_pressed():
	get_tree().paused = false
	$dialogue4.hide()
	$"next>".hide()
	$dialogue.hide()


func _on__3_pressed():
	$">>>_3".hide()
	$"next>".show()
	$dialogue3.hide()
	$dialogue4.show()
