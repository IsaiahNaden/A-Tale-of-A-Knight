extends Control
class_name  Playerdata


@export var speed = 0
@export var health = 1
@export var SavePos : Vector2

func chaneg_health (value : int) :
	health += value 

func UpdatePos (value : Vector2):
	SavePos = value
