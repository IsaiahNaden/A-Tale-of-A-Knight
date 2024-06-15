extends Area2D


#

func _on_body_entered(body):
	if body.is_in_group('player'):
		position.x = 30
		position.y = 30
