extends Node

var LavelBase : Node
var Player : CharacterBody2D

var playerScenePath = "res://scenes/main_character.tscn"

@onready var level_1 = preload("res://scenes/level_1.tscn").instantiate()
@onready var level_2 = preload("res://scenes/level_2.tscn").instantiate()
@onready var level_3 = preload("res://scenes/level_3.tscn").instantiate()

var LoadedLevel : String 
var position : float

var username 
var userid 

func _ready():
	pass
	
func _process(delta):
	pass
	
func get_username ():
	username = $"../../interface/dailgue1".username


func get_userid ():
	userid = $"../../interface/dailgue1".userid
	
var character
func get_position() :
	character = $"../../base_game/MainCharacter"
	

func LoadLevel(path :String , SpawnIndex : int):

	LoadedLevel = path
	SpawnIndex = SpawnIndex
	
	var loadScene : PackedScene = ResourceLoader.load("res://scenes/level_1_start.tscn")
	var loadSceneNode = loadScene.instantiate()
	get_tree().root.add_child(loadSceneNode)
	loadSceneNode.LoadLevel(path , SpawnIndex) #***
	



func CheckForPlayer():
	if (Player == null ):
		var playerScene : PackedScene = ResourceLoader.load(playerScenePath)
		Player = playerScene.instantiate()
		get_tree().get_nodes_in_group("PlayerParent")[0].add_child(Player)
		pass
		

var player 

func playerposition() :
	player = $"../../base_game/MainCharacter"
	position = player.position

