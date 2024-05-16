extends Node

# Load user data when the game starts
func _ready():
	load_user_data()
	load_player_location()

# Save user data when the game exits
func _on_Quit_pressed():
	save_user_data()
	save_player_location()
	get_tree().quit()

# Load user data from config file
func load_user_data():
	var config = ConfigFile.new()
	var error = config.load("userdata.json")
	if error == OK:
		if config.has_section("user"):
			# Load user data
			var username = config.get_value("user", "username")
			var level = config.get_value("user", "level")
			print("Loaded user data:", username, level)

# Save user data to config file
func save_user_data():
	var config = ConfigFile.new()
	config.set_value("user", "username", "Player1")
	config.set_value("user", "level", 5)
	var error = config.save("userdata.json")
	if error != OK:
		print("Error saving user data")

# Load player location from config file
func load_player_location():
	var config = ConfigFile.new()
	var error = config.load("res://manu/userprofile.json")
	if error == OK:
		if config.has_section("location"):
			var x = config.get_value("location", "x")
			var y = config.get_value("location", "y")
			var player_position = Vector2(float(x), float(y))
			# Set player position
			$Player.position = player_position

# Save player location to config file
func save_player_location():
	var config = ConfigFile.new()
	config.set_value("location", "x", $Player.position.x)
	config.set_value("location", "y", $Player.position.y)
	var error = config.save("userprofile.json")
	if error != OK:
		print("Error saving player location")

