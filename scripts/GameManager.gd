extends Node

var LavelBase : Node
var Player :Node2D
var playerScenePath #="scene character "
var LoadedLevel : String 
var SpawnIndex : int
var Inventory #:Inventory
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

func LoadLevel(path :String , spawnIndex : int):

	LoadedLevel = path
	SpawnIndex = SpawnIndex
	
	var loadScene : PackedScene = ResourceLoader.load("res://scenes/game.tscn")
	var loadSceneNode = loadScene.instantiate()
	get_tree().root.add_child(loadSceneNode)
	loadSceneNode.LoadLevel(path , spawnIndex)

func CheckForPlayer():
	if (Player == null ):
		var playerScene : PackedScene = ResourceLoader.load(playerScenePath)
		Player = playerScene.instantiate()
		get_tree().get_nodes_in_group("PlayerParent")[0].add_child(Player)
		pass
		
		
func MovePlayer(targetIndex : int):
	var indexs : Array[Node] = get_tree().get_nodes_in_group("SpawnIndex")
	
	for i in indexs :
		if i.SpawnIndex == targetIndex :
			Player.global_positon = i.global_position
			Player.rotation_degrees = i.rotation_degrees
