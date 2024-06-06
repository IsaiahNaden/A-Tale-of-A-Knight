extends Node

var data = {}

var save_path = "res://scripts/userdata.json"
@onready var username = $"../../interface/dailgue1".username
@onready var userid = $"../../interface/dailgue1".userid

func save_data ():
	username = $"../../interface/dailgue1".username
	userid = $"../../interface/dailgue1".userid
	
	var userdata = {
		"username": {
			"user_name": username,
			"user_id": userid
		}
	}
	userdata.save(save_path)
