extends CharacterBody2D


var speed = 40
var player_chase = false
var player = null

var health = 100
var player_inattack_range = false
var can_take_damage = true

var double_damage_active = false
var double_damage_timer = Timer




func _ready():
	double_damage_timer = $double_damage_timer

func _physics_process(delta):
	deal_with_damage()
	update_health()

	
	if player_chase:
		position += (player.position - position).normalized() * speed * delta
		if player_inattack_range:
			$AnimatedSprite2D.play("attack")
		else:
			$AnimatedSprite2D.play("idle")
	else: 
		$AnimatedSprite2D.play("idle")
		

	if Input.is_action_just_pressed("ui_double_damage"):
		activate_double_damage()




func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_range = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_range = true

func deal_with_damage():
	if player_inattack_range and global.player_current_attack == true:
		if can_take_damage:
			health = health - 20
			if double_damage_active:
				double_damage_timer.start()
				health = health - 40
			$take_damage_cooldown.start()
			can_take_damage = false
			print("enemy health = ", health)
			if health <= 0:
				self.queue_free()


		


func _on_take_damage_cooldown_timeout():
	can_take_damage = true
	
func update_health():
	var healthbar = $healthbar
	
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true



func activate_double_damage():
	double_damage_active = true
	double_damage_timer.start()
	print("double damage activated")



func _on_double_damage_timer_timeout():
	double_damage_active = false
	print("double damage deactivated")
