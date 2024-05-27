extends Node

var player_current_attack = false

var current_scene = "world_2" #world cliff_side
var transition_scene = false

var player_exit_cliffside_posx = 200
var player_exit_cliffside_posy = 28
var player_start_posx = 50
var player_start_posy = 143

var game_first_loadin = true


func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene =="world_2":
			current_scene = "cliff_side"
		else:
			current_scene = "world_2"

