extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

var attack_ip = false


const normal_speed = 100
const boosted_speed = 200
var current_speed = normal_speed

var speed_boost_active = false

var invulnerable = false

var current_dir = "none"

var speed_boost_timer: Timer
var speed_boost_label: Label
var speed_boost_label_timer: Timer
var speed_boost_inactive_label_timer: Timer
var speed_boost_inactive_label: Label

var invulnerability_timer: Timer
var invulnerability_label: Label
var invulnerability_label_timer: Timer
var invulnerability_inactive_label: Label
var invulnerability_inactive_label_timer: Timer



func _ready():
	speed_boost_timer = $speed_boost_timer
	speed_boost_label = $SpeedBoostLabel
	speed_boost_label_timer = $speed_boost_label_timer
	speed_boost_inactive_label = $SpeedBoostInactiveLabel
	speed_boost_inactive_label_timer = $speed_boost_inactive_label_timer
	speed_boost_label.visible = false
	speed_boost_inactive_label.visible = false
	
	invulnerability_timer = $invulnerability_timer
	invulnerability_label = $InvulnerabilityLabel
	invulnerability_label_timer = $invulnerability_label_timer
	invulnerability_inactive_label = $InvulnerabilityInactiveLabel
	invulnerability_inactive_label_timer = $invulnerability_inactive_label_timer
	invulnerability_label.visible = false
	invulnerability_inactive_label.visible = false


func _physics_process(delta):
	player_movement(delta)
	enemy_attack()
	attack()
	current_camera()
	update_health()
	
	if health <= 0:
		player_alive = false  #add respawn screen
		health = 0
		print("player has died")
		self.queue_free()

			
	   
 
		
		
		

func player_movement(delta):
	
	if Input.is_action_just_pressed("ui_select"):
		speed_boost_active = !speed_boost_active
		if speed_boost_active:
			speed_boost_timer.start()
			speed_boost_label.visible = true
			speed_boost_label_timer.start()
		else:
			speed_boost_timer.stop()
			speed_boost_label.visible = false
		
	if speed_boost_active:
		current_speed = boosted_speed
	else:
		current_speed = normal_speed
		
	if Input.is_action_just_pressed("ui_invulnerability"):
		invulnerable = !invulnerable
		if invulnerable:
			invulnerable = true
			invulnerability_timer.start()
			invulnerability_label.visible = true
			invulnerability_label_timer.start()
			$AnimatedSprite2D.modulate = Color(1, 1, 1, 0.5)
			print("Player is now invulnerable")
		else:
			invulnerable = false
			invulnerability_timer.stop()
			invulnerability_label.visible = false
			$AnimatedSprite2D.modulate = Color(1, 1, 1, 1)
			print("Player is no longer invulnerable")
	

	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = current_speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -current_speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = current_speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -current_speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
		
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("idle_knight")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("idle_knight")

	if dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("idle_knight")
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("idle_knight")
			

func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown and not invulnerable == true:
		health = health - 20
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print("player health = ", health)

func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true
	
func attack():
	var dir = current_dir
	
	
	if Input.is_action_just_pressed("attack"):
		global.player_current_attack = true
		attack_ip = true
		if dir =="right":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("side_attack")
			$deal_attack_timer.start()
		if dir == "left":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("side_attack")
			$deal_attack_timer.start()
		if dir == "down":
			$AnimatedSprite2D.play("front_attack")
			$deal_attack_timer.start()
		if dir == "up":
			$AnimatedSprite2D.play("back_attack")
			$deal_attack_timer.start()


func _on_deal_attack_timer_timeout():
	$deal_attack_timer.start()
	global.player_current_attack = false
	attack_ip = false


func current_camera():
	if global.current_scene == "world":
		$world_camera.enabled = true
		$cliffside_camera.enabled = false
	elif global.current_scene == "cliff_side":
		$world_camera.enabled = false
		$cliffside_camera.enabled = true
		
		
		
		
func update_health():
	var healthbar = $healthbar
	
	healthbar.value = health
	
	if health >=100:
		healthbar.visible = false
	else:
		healthbar.visible = true


func _on_regen_timer_timeout():
	if health < 100:
		health = health + 20
		if health > 100:
			health = 100
	if health <= 0:
		health = 0


func _on_speed_boost_timer_timeout():
	speed_boost_active = false
	speed_boost_inactive_label.visible = true
	speed_boost_inactive_label_timer.start()



func _on_speed_boost_label_timer_timeout():
	speed_boost_label.visible = false



func _on_speed_boost_inactive_label_timer_timeout():
	speed_boost_inactive_label.visible = false



func _on_invulnerability_timer_timeout():
	invulnerable = false
	invulnerability_inactive_label.visible = true
	invulnerability_inactive_label_timer.start()
	$AnimatedSprite2D.modulate = Color(1, 1, 1, 1)




func _on_invulnerability_label_timer_timeout():
	invulnerability_label.visible = false


func _on_invulnerability_inactive_label_timer_timeout():
	invulnerability_inactive_label.visible = false

